//
//  SwiftUIView.swift
//  LOTR-Converter
//
//  Created by Tejas on 2023-05-27.
//

import SwiftUI

struct CurrencyGridView: View {
    
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    @Binding var currency: Currency
    let allCurrencyName = CurrencyName.allCases
    let allCurrencyImage = CurrencyImage.allCases

    
    var body: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach( 0..<5 ) { index in
                if Currency.allCases[index] == currency {
                    CurrencyIcon(currencyImage: allCurrencyImage[index].rawValue, currencyText: allCurrencyName[index].rawValue)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 3)
                            .opacity(0.5))
                        .shadow(color: .black, radius: 9)
                } else {
                    CurrencyIcon(currencyImage: allCurrencyImage[index].rawValue, currencyText: allCurrencyName[index].rawValue)
                }
            }
        }
        .padding([.leading, .trailing, .bottom])
    }
}

struct CurrencyGridView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyGridView(currency: .constant(.goldPiece))
            .previewLayout(.sizeThatFits)
    }
}
