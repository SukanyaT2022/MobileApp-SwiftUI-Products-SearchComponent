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
    
// array of pet detail obj
    let allPetDataArray: [PetDetail] = [
       PetDetail(title: "Name", value: "Fluffykins"),
       PetDetail(title: "Species", value: "Dog"),
       PetDetail(title: "Breed", value: "Labrador"),
       PetDetail(title: "Age", value: "2 years"),
       PetDetail(title: "Gender", value: "Female"),
       PetDetail(title: "Color", value: "Yellow"),
        ]
       
    
    var body: some View {
        VStack{
            BigSquareCompView()
            ForEach(allPetDataArray) {pet in
                DeatilTitleCompView(title: pet.title, value: pet.value)
            }
            
        }
      
        
    }
}

#Preview {
    DetailScreenView()
}
