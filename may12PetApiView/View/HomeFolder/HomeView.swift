//
//  HomeView.swift
//  may12PetApiView
//
//  Created by TS2 on 5/12/25.
//

import SwiftUI

struct HomeView: View {
    //    this func bring json data to  homescreen
    // [PetModel] come from name to model on from model folder
    @State  var petsVarOnlyHomeView: [PetModel]
    func loadPetBreedsFromJSON() -> [PetModel] {
        //step 2- this part search for file data.json- find or not - else if not find [] means just get out
        guard let url = Bundle.main.url(forResource: "PetData", withExtension: "json") else {
            print("❌ pets.json not found in bundle")
            return []
        }
        print(url)
        do {
            //step 3 we extract data inside file url
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            //decode convert json to swift obj
            let petsContainer = try decoder.decode(PetsContainer.self, from: data)
            //            petsContainer.pets  - come fron petmodel name of struct
            //key name have to becareful need to match key (petss) on jason- and in pet modal and in function
            return petsContainer.petss
        } catch {
            print("❌ Failed to load or decode pets.json: \(error)")
            return []
        }
    }
    
    //filter function
    @State var searchText: String = ""
    var filteredItems: [PetModel] {
        print(searchText)
        
        if searchText.isEmpty {
            return petsVarOnlyHomeView
        } else {
            return petsVarOnlyHomeView.filter {
                $0.type.lowercased()==(searchText.lowercased())
                || $0.breed.lowercased().contains(searchText.lowercased())
            }
        }
        
        
        
        
        
        //if nothting on search box then showll pets
//        switch catergory {
//        case .dog:
//            
//            
//        case .cat:
//            if searchText.isEmpty {
//                return petsVarOnlyHomeView
//            } else {
//                return pets.filter {
//                    $0.type.lowercased()==("cat".lowercased())
//                    || $0.breed.lowercased().contains(searchText.lowercased())
//                }
//            }
//            
//            
//        case .bird:
//            break
//        case .fish:
//            break
//        case .others:
//            break
//        }
//        return []
    }
    
   
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Let's find")
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Little Friends!")
                    .font(.system(size: 20, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 1)
            }
            //            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            //            SearchBarCompView()
            //                .padding(.top, 10)
            
            //when user type it will save result in storesearchvar inside searchbarcomponent-- and home view save what user type on search text
            SearchBarCompView(storeSearchVar: $searchText)
            
            HStack{
                Text("Catergory")
                    .font(.system(size: 18, weight: .semibold))
                //                    .foregroundColor(.blue)
                Spacer()
                Text("See All")
                    .font(.system(size: 18, weight: .regular))
                //                    .foregroundColor(.gray)
            }//close hstack viewall
            .padding(.top, 10)
            
            
            //square component
            SquareCompMapView(petArrayOfPetModel: filteredItems)
            
        }//close main vstack
        .padding(15)
        
        .onAppear{
            //pets come from state line 13 variable - array of [PetModel]
            petsVarOnlyHomeView =  self.loadPetBreedsFromJSON()
            
        }
    }
}

#Preview {
    HomeView(petsVarOnlyHomeView: [])
}

