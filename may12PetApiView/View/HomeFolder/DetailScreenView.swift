//
//  DetailScreenView.swift
//  may12PetApiView
//
//  Created by TS2 on 6/2/25.
//

import SwiftUI

//we use struct for object
struct PetDetail: Identifiable {
var id = UUID()
let title: String
let value: String
}
struct DetailScreenView: View {
    let petDetail : PetModel
    
// array of pet detail obj
  @State var allPetDataArray: [PetDetail] = []
       
    func helperFunction(){
        let allPetDataArray: [PetDetail] = [
            PetDetail(title: "Name", value: petDetail.petName),
            PetDetail(title: "Species",value: petDetail.type ),
           PetDetail(title: "Breed", value: petDetail.breed),
           PetDetail(title: "Age", value: "\(petDetail.age)"),
            // because value is int--change value vlaue from int to string
            
//           PetDetail(title: "Gender", value: petDetail.age),
//           PetDetail(title: "Color", value: petDetail.petName),
            ]
        self.allPetDataArray = allPetDataArray
    }
    var body: some View {
        VStack{
            ScrollView{
                BigSquareCompView()
                ForEach(allPetDataArray) {pet in
                    DeatilTitleCompView(title: pet.title, value: pet.value)
                }
            }
            
        }
        .onAppear(){
            self.helperFunction()
        }
        
    }
}

#Preview {
    DetailScreenView(petDetail: PetModel(petName: "", type: "", address: Address(street: "", city: "", state: "", zip: ""), yearOfBirth: 0, age: 0, breed: "", activities: [""], image: "", distance: ""))
}
