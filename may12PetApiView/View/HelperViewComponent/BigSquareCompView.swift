//
//  BigSquareCompView.swift
//  may12PetApiView
//
//  Created by TS2 on 6/2/25.
//

import SwiftUI

struct BigSquareCompView: View {
    var body: some View {
        VStack {
            Text("Pet Details!")
            
                .font(.system(size: 24, weight: .semibold, design: .default))
            Rectangle()
                .frame(width: 300, height: 300)
                .foregroundColor(.red)
                .cornerRadius(20)
//                .image()
        
            }
        }
     
       
    }


#Preview {
    BigSquareCompView()
}
