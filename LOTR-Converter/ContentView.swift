//
//  ContentView.swift
//  LOTR-Converter
//
//  Created by Tejas on 2023-05-26.
//

import SwiftUI

struct ContentView: View {
    
    @State var txtLeftTF: String = ""
    @State var txtRightTF: String = ""
    
    var body: some View {
        ZStack {
            // Background Image
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                // Image
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                // Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                // Currency exchange section
                HStack {
                    // Left
                    VStack {
                        //currency
                        HStack {
                            //currency image
                            Image("silverpiece")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //currency text
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        //TExtField
                        TextField("Amount", text: $txtLeftTF)
                            .padding(7)
                            .background(Color(.systemGray6))
                            .cornerRadius(7)
                        
                    }
                    
                    // = sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    // Right
                    VStack {
                        //currency
                        HStack {
                            //currency image
                            Image("goldpiece")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //currency text
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        
                        //TExtField
                        TextField("Amount", text: $txtRightTF)
                            .padding(7)
                            .background(Color(.systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(15)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        print("Show this")
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                }
            }
            .padding(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
