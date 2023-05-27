//
//  ExchangeRate.swift
//  LOTR-Converter
//
//  Created by Tejas on 2023-05-27.
//

import SwiftUI

struct ExchangeRate: View {
    
    @State var leftImage: String
    @State var text: String
    @State var rightImage: String
    
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 30)
            Text(text)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 30)
        }
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(leftImage: "silverpiece", text: "1 Silver Piece = 4 Silver Pennies", rightImage: "silverpenny")
            .previewLayout(.sizeThatFits)
    }
}
