//
//  SelectCurrency.swift
//  LOTR-Converter
//
//  Created by Tejas on 2023-05-27.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    
    var body: some View {
        ZStack {
            // Background parchment image
            
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            
            VStack {
                // Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                // Currency Icon
                let allCurrencyName = CurrencyName.allCases
                let allCurrencyImage = CurrencyImage.allCases
                
                LazyVGrid(columns: gridLayout) {
                    ForEach( 0..<5 ) { index in
                        
                        if Currency.allCases[index] == leftCurrency {
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
                
                // Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                // Currency Icon
                LazyVGrid(columns: gridLayout) {
                    ForEach( 0..<5 ) { index in
                        if Currency.allCases[index] == rightCurrency {
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
                // Done button
                Button {
                    print("dismissing this view")
                    dismiss()
                } label: {
                    Text("Done")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color(.systemBrown))
                .cornerRadius(20)
            }
            .padding()
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))
    }
}
