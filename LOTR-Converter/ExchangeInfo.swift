//
//  ExchangeInfo.swift
//  LOTR-Converter
//
//  Created by Tejas on 2023-05-26.
//

import SwiftUI

struct ExchangeInfo: View {
    
    @State var descriptionText: String = "AddInstanceForFactory: No factory registered for id AddInstanceForFactory: No factory registered for id AddInstanceForFactory: No factory registered for id AddInstanceForFactory: No factory registered for id AddInstanceForFactory: No factory registered for id"
    var body: some View {
        
        ZStack {
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(Color(.brown))
            VStack {
                // Large Text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                // Text for Description
                Text("AddInstanceForFactory: No factory registered for id AddInstanceForFactory: No factory registered for id AddInstanceForFactory: No factory registered for id AddInstanceForFactory: No factory registered for id AddInstanceForFactory: No factory registered for id")
                    .font(.body)
                    .foregroundColor(.black)
                    .padding(.top, -5)
                // Another VStack
                VStack {
                    
                    // First
                    HStack {
                        Image("goldpiece")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                        Text("1 Gold Price = 4 Gold Pennies")
                        Image("goldpenny")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                    }
                    
                    // Second
                    HStack {
                        Image("goldpenny")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                        Text("1 Gold Penny = 4 Silver Pieces")
                        Image("silverpiece")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                    }
                    
                    // Third
                    HStack {
                        Image("silverpiece")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                        Text("1 Silver Piece = 4 Silver Pennies")
                        Image("silverpenny")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                    }
                    
                    // Forth
                    HStack {
                        Image("silverpenny")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                        Text("1 Silver Penny = 100 Copper Pennies")
                        Image("copperpenny")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                    }
                    Button {
                        print("Done button Action")
                    } label: {
                        Text("Done")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color(.systemBrown))
                    .cornerRadius(20)
                    
                }
                
            }
            .padding()
        }
    }
}

struct ExchangeInfo_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeInfo()
    }
}
