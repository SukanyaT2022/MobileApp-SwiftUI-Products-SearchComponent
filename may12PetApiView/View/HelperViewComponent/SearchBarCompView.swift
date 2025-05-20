//
//  SearchBarView.swift
//  may12PetApiView
//
//  Created by TS2 on 5/12/25.
//

import SwiftUI

struct SearchBarCompView: View {
    @Binding var storeSearchVar: String
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search....", text: $storeSearchVar)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                Image(systemName: "circle.grid.cross.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
                    .padding(.leading, 3)
                  
            }
        }.padding(5)
    }
}

#Preview {
    SearchBarCompView(storeSearchVar: .constant(""))
}
