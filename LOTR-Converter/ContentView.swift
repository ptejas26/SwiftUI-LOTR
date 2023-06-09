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
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    @State var showCurrencySelector: Bool = false
    @State var showInfoSelector: Bool = false
    @State var leftAmountTemp: String = ""
    @State var rightAmountTemp: String = ""
    @State var leftTyping = false
    @State var rightTyping = false

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
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency) ?? 0].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //currency text
                            Text(CurrencyName.allCases[Currency.allCases.firstIndex(of: leftCurrency) ?? 0].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showCurrencySelector.toggle()
                        }.sheet(isPresented: $showCurrencySelector) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        //TExtField
                        TextField("Amount", text: $txtLeftTF, onEditingChanged: { typing in
                            leftTyping = typing
                            leftAmountTemp = txtLeftTF
                        })
                            .padding(7)
                            .background(Color(.systemGray6))
                            .cornerRadius(7)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftTyping ? txtLeftTF : leftAmountTemp) { newValue in
                                
                                txtRightTF = leftCurrency.convert(amountString: txtLeftTF, to: rightCurrency)
                            }
                            .onChange(of: leftCurrency) { _ in
                                txtLeftTF = rightCurrency.convert(amountString: txtRightTF, to: leftCurrency)
                            }
                        
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
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency) ?? 0].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //currency text
                            Text(CurrencyName.allCases[Currency.allCases.firstIndex(of: rightCurrency) ?? 0].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showCurrencySelector.toggle()
                        }.sheet(isPresented: $showCurrencySelector) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        //TExtField
                        TextField("Amount", text: $txtRightTF, onEditingChanged: { typing in
                            rightTyping = typing
                            rightAmountTemp = txtRightTF
                        })
                            .padding(7)
                            .background(Color(.systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightTyping ? txtRightTF : rightAmountTemp) { newValue in
                                txtLeftTF = rightCurrency.convert(amountString: txtRightTF, to: leftCurrency)
                            }
                            .onChange(of: rightCurrency) { _ in
                                txtRightTF = leftCurrency.convert(amountString: txtLeftTF, to: rightCurrency)
                            }
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(15)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        print("Show info button")
                        showInfoSelector.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .sheet(isPresented: $showInfoSelector) {
                        ExchangeInfo()
                    }
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
