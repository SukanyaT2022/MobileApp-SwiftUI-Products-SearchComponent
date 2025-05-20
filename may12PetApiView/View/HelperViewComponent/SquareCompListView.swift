//
//  SquareCompListView.swift
//  may12PetApiView
//
//  Created by TS2 on 5/16/25.
//

import SwiftUI

struct SquareCompListView: View {
    
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
    var body: some View {
        List(petArray, rowContent: { pet in
            ZStack(alignment: .bottom) {
                Rectangle()
                    .frame(width: 160, height: 160)
                    .foregroundColor(Color(hex: "f1c40f"))
                    .cornerRadius(25)
                
                Image(pet.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .offset(x: 60, y: 20)
                
                // Heart icon in top left corner
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.red)
                    .offset(x: -50, y: -110)
                
                Text(pet.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .offset(x: 2, y: -105)
                
                Text("2.3km Away")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .offset(x: -20, y: -20)
            }
            
        })
        
            }
        }

#Preview {
    SquareCompListView()
}
