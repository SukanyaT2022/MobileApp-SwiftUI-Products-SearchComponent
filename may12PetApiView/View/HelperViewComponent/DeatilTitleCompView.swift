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
        HStack(spacing:20){
            
            HStack(alignment: .firstTextBaseline, spacing:30){
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Text(value)
                    .font(.system(size: 20))
            }//close hstack
            .background(Color.green)
            Spacer()
        }// close parent h stack
        .background(Color.red)
        .padding(.horizontal,20)
       
        
    }
}
#Preview {
    DeatilTitleCompView(title: "name", value: "addvalue")
}
