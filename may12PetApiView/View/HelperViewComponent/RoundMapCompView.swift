//
//  RoundMapCompView.swift
//  may12PetApiView
//
//  Created by TS2 on 5/15/25.
//

import SwiftUI

struct RoundMapCompView: View {
    
    struct Pet: Identifiable{
        let name:String
        let imageName:String
        let id = UUID()
    }
    
    
    let petArray: [Pet] = [
        Pet(name: "cat", imageName: "dog3bg"),
        Pet(name: "dog", imageName: "img2"),
        Pet(name: "bird", imageName: "img1"),
        Pet(name: "fish", imageName: "img2"),
        Pet(name: "lizard", imageName: "img1"),
        ]
    
    var rows: [GridItem] = [
        GridItem(.flexible(minimum: 50))
    ]
    
    
    var body: some View {
        VStack{
           
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHGrid(rows: rows, spacing: 1) {
           
                        ForEach(petArray) { pet in
                            
                            ZStack(alignment: .top){
                                Circle()
                                //put color inside to circle
                                    .foregroundColor(Color.blue)
                                    .frame(width: 150, height: 150, alignment: .center)
                                //                    .frame(alignment:.center)
                                //                Image(systemName: "mappin.circle.fill")
                                Image(pet.imageName)
                                    .resizable()
                                //                    .scaledToFill()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.white)
                                Text(pet.name)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                //this push text down
                                    .offset(y: 100)
                                
                            }
                            
                         
                        }
                    }//close lazyHgride
                    .padding() // Add padding for better spacing
                
                
                }
            
            
            
            
//            ZStack{
//                Rectangle()
//                    .fill(selectedPet == pet.name ? Color(hex: AppThemeColor.orange).opacity(0.2) : Color.gray.opacity(0.5))
//                    .frame(width: 80, height: 80)
//                    .clipShape(Circle())
//                    .onTapGesture {
//                     
//                        if selectedPet == pet.name{
//                            selectedPet = nil
//                        }else{
//                            selectedPet = pet.name
//                        }
//                    }
//            }
//            OvalBoxView(petType: pet.name, petImage: pet.imageName)
            
            
            
            
            
            
            
            
            
        }
    }
}

#Preview {
    RoundMapCompView()
}
