//
//  BuyStableCoin.swift
//  trialuisdkProject
//
//  Created by Edwin work on 07/03/2025.
//

import SwiftUI

struct BuyStableCoinView: View {
    private let currentBalance: Double
    @State private var amountToPay: String = ""
    @State private var amountToGet: String = ""
    
    init(currentBalance: Double) {
        self.currentBalance = currentBalance
    }
    
    var body: some View {
        VStack(spacing: 16) {
            // Top Bar
            HStack {
                Text("Buy")
                    .font(.largeTitle.bold())
                Spacer()
                Button(action: {}) {
                    HStack {
                        Text("History")
                            .foregroundColor(.green)
                        Image(systemName: "clock")
                            .foregroundColor(.green)
                    }
                }
            }
            .padding()
            
            // Payment Box
            CardView(title: "You will pay", currency: "AED", balance: "\(currentBalance) AED", icon: "creditcard", amount: $amountToPay)
            
            // Receiving Box
            CardView(title: "You will get", currency: "AEDC", balance: "8900.00 AEDC", icon: "link.circle", amount: $amountToGet)
            
            // Exchange Rate Info
            VStack {
                HStack {
                    Image(systemName: "arrow.triangle.2.circlepath")
                        .foregroundColor(.green)
                    Text("The exchange rate updates every 30 seconds")
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
    }
}

// MARK: - Card View
struct CardView: View {
    let title: String
    let currency: String
    let balance: String
    let icon: String
    @Binding var amount: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .foregroundColor(.gray)
                .font(.subheadline)
            
            HStack {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(.gray)
                
                Text(currency)
                    .font(.title3.bold())
                    .foregroundColor(.black)
                
                Spacer()
                
                TextField("0.00", text: $amount)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
            
            Text("Balance: \(balance)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).shadow(radius: 1))
    }
}

struct BuyStableCoinView_Previews: PreviewProvider {
    static var previews: some View {
        BuyStableCoinView(currentBalance: 5444784521.24)
    }
}
