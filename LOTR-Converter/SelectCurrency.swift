//
//  SelectCurrency.swift
//  LOTR-Converter
//
//  Created by Tejas on 2023-05-27.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
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
                CurrencyGridView(currency: .constant(leftCurrency))
                
                // Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                // Currency Icon
                CurrencyGridView(currency: .constant(rightCurrency))
                
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
        SelectCurrency(leftCurrency: .constant(.silverPenny), rightCurrency: .constant(.goldPenny))
    }
}
