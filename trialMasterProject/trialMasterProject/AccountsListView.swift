//
//  ContentView.swift
//  trialMasterProject
//
//  Created by Edwin work on 07/03/2025.
//

import SwiftUI
import trialuisdkProject

struct AccountsListView: View {
    @State private var selectedTab = "Accounts"
    let tabs = ["All", "Accounts", "Credit Cards", "Loans and More"]
    @State private var isActive: Bool = false
    let cryptoManager = CryptoInfoManager.shared
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(tabs, id: \..self) { tab in
                            Button(action: {
                                selectedTab = tab
                            }) {
                                Text(tab)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(selectedTab == tab ? Color.blue.opacity(0.2) : Color.clear)
                                    .foregroundColor(selectedTab == tab ? .blue : .black)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 5)
                .background(Color.white)
                
                VStack(alignment: .leading) {
                    Text("ACCOUNTS")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    ScrollView {
                        VStack(spacing: 10) {
                            AccountCardView(accountName: "Savings account", accountNumber: "1001 3858 2547 2002", accountType: "iSave Online Account", balance: "78544489.55")
                            AccountCardView(accountName: "Elite gold current account", accountNumber: "1411 0058 2547 2001", accountType: "Elite gold current account", balance: "30,000")
                            NavigationLink(destination: introScreen(currentAEDBalance: 78544489.55), isActive: $isActive) {
                                AccountCardView(accountName: "StableCoin Account", accountNumber: "5681 0245 1048 6522", accountType: "Crypto wallet account", balance: "\(cryptoManager.fetchStableCoinBalance())")
                                    .onTapGesture {
                                        isActive = true
                                    }
                                            }
                        }
                    }
                }
                .padding(.top)
            }
            .navigationBarTitle("", displayMode: .inline)
            .foregroundColor(.yellow)
            
        }
        .accentColor(.black)
    }
}

struct AccountCardView: View {
    let accountName: String
    let accountNumber: String
    let accountType: String
    let balance: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(accountName)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(accountNumber)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                Text(accountType)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
                
                Text("AED \(balance)")
                    .font(.title3.bold())
                    .foregroundColor(.white)
                Text("Available balance")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
            }
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "star")
                    .foregroundColor(.white)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.9), Color.gray.opacity(0.6)]), startPoint: .leading, endPoint: .trailing)
        )
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

struct AccountsListView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsListView()
    }
}
