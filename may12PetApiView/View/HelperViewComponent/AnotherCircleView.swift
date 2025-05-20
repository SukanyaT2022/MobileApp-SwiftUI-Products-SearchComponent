//
//  AnotherCircleView.swift
//  may12PetApiView
//
//  Created by TS2 on 5/15/25.
//

import SwiftUI

struct AnotherCircleView: View {
    var body: some View {
        //verticalOffset: 15 help to push the text down
        CircleView(diameter: 120, color: .green, verticalOffset: 5) {
            VStack(spacing: 5) {
                Image(systemName: "mappin.circle.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
                
                Text("lulu")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    AnotherCircleView()
}
