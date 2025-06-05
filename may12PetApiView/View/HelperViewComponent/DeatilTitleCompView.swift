//
//  DeatilTitleCompView.swift
//  may12PetApiView
//
//  Created by TS2 on 6/2/25.
//

import SwiftUI

struct DeatilTitleCompView: View {
    let title: String
    let value: String
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            // Title takes 30% width
            Text(title)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .multilineTextAlignment(.leading)
                .frame(width: (UIScreen.main.bounds.width - 20) * 0.3, alignment: .leading)
                .background(Color.red)
            
            // Value takes 70% width
            Text(value)
                .font(.system(size: 20))
                .multilineTextAlignment(.leading)
                .frame(width: (UIScreen.main.bounds.width - 20) * 0.6, alignment: .leading)
                .background(Color.green)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    DeatilTitleCompView(title: "name", value: "detail")
}
