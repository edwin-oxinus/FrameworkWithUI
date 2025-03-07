//
//  CryptoWalletview.swift
//  trialuisdkProject
//
//  Created by Edwin work on 07/03/2025.
//

import SwiftUI

struct CryptoWalletView: View {
    let currentAEDBalance: Double
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(currentAEDBalance: currentAEDBalance)
            AssetsListView()
            Spacer()
            BottomNavBar()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

// MARK: - Header Section
struct HeaderView: View {
    let currentAEDBalance: Double
    @State private var didTapSend = false
    @State private var didTapBuy = false
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Crypto Wallet")
                .font(.headline)
                .foregroundColor(.white)
            
            Text("10,603.00 AED")
                .font(.largeTitle.bold())
                .foregroundColor(.white)
            
            HStack(spacing: 8) {
                Text("AECoin : 0.00335")
                    .foregroundColor(.white)
                Text("4.27%")
                    .foregroundColor(.green)
            }
            .padding(6)
            .background(Color.black.opacity(0.3))
            .cornerRadius(8)
            
            HStack(spacing: 40) {
                NavigationLink(destination: SendTokenView(), isActive: $didTapSend) {
                    ActionButton(icon: "arrow.up", label: "Send")
                        .onTapGesture {
                            didTapSend = true
                        }
                }
                
                ActionButton(icon: "arrow.down", label: "Receive")
                NavigationLink(destination: BuyStableCoinView(currentBalance: currentAEDBalance), isActive: $didTapBuy) {
                    ActionButton(icon: "plus", label: "Buy")
                        .onTapGesture {
                            didTapBuy = true
                        }
                }
                
                
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.green, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.top)
        )
    }
}

// MARK: - Action Buttons
struct ActionButton: View {
    var icon: String
    var label: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.black)
                .frame(width: 60, height: 60)
                .background(Color.white)
                .clipShape(Circle())
            
            Text(label)
                .foregroundColor(.white)
                .font(.footnote)
        }
    }
}

// MARK: - Assets List
struct AssetsListView: View {
        
    let assets = [
        (name: "AECoin", price: "2028.73 AED", value: "8,900.00", change: "+4.27%", color: Color.green, logo: "https://cryptologos.cc/logos/superverse-super-logo.png?v=040"),
        (name: "Etherium", price: "1426.60 AED", value: "550.00", change: "+2.05%", color: Color.green, logo: "https://cryptologos.cc/logos/ethereum-eth-logo.png?v=040"),
        (name: "Bitcoin", price: "1355.00 AED", value: "2,010.00", change: "-1.03%", color: Color.red, logo: "https://cryptologos.cc/logos/bitcoin-btc-logo.png?v=040"),
        (name: "Polygon", price: "209.90 AED", value: "943.00", change: "+0.04%", color: Color.green, logo: "https://cryptologos.cc/logos/polygon-matic-logo.png?v=040")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("My Assets")
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            ForEach(assets, id: \..name) { asset in
                AssetRow(name: asset.name, price: asset.price, value: asset.value, logo: asset.logo, change: asset.change, changeColor: asset.color)
            }
        }
        .padding(.vertical)
        .background(Color.black)
    }
}

// MARK: - Asset Row
struct AssetRow: View {
    var name: String
    var price: String
    var value: String
    var logo: String?
    var change: String
    var changeColor: Color
    
    
    var body: some View {
        HStack {
            if let logoURL = URL(string: logo ?? "") {
                ImageView(url: logoURL)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.gray)
                    .cornerRadius(15)
            }
            else {
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading) {
                Text(name)
                    .foregroundColor(.white)
                Text(price)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            Text(value)
                .foregroundColor(.white)
            
            Text(change)
                .foregroundColor(changeColor)
        }
        .padding()
    }
}

// MARK: - Bottom Navigation Bar
struct BottomNavBar: View {
    var body: some View {
        HStack {
            BottomNavItem(icon: "wallet.pass", label: "Wallet", isSelected: true)
            BottomNavItem(icon: "arrow.triangle.swap", label: "Swap")
            BottomNavItem(icon: "arrow.left.arrow.right", label: "Transactions")
        }
        .padding()
        .background(Color.black)
    }
}

struct BottomNavItem: View {
    var icon: String
    var label: String
    var isSelected: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .foregroundColor(.white)
            Text(label)
                .foregroundColor(.white)
                .font(.caption2)
        }
        .padding()
        .background(isSelected ? Color.gray : Color.clear)
        .cornerRadius(15)
        .frame(maxWidth: .infinity)
        
    }
}

struct CryptoWalletView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoWalletView(currentAEDBalance: 580244521.25)
    }
}
