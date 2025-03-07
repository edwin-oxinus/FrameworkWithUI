//
//  SendTokenView.swift
//  trialuisdkProject
//
//  Created by Edwin work on 07/03/2025.
//

import SwiftUI

struct SendTokenView: View {
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Send")
                    .font(.largeTitle.bold())
                    .foregroundColor(.black)
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
            
            VStack(alignment: .center, spacing: 10) {
                Text("Total Balance")
                    .font(.subheadline)
                    .foregroundColor(.black)
                Text("3114031 AEDC")
                    .font(.largeTitle.bold())
                    .foregroundColor(.black)
                
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
            
            Text("Fill the below form to send your AEDC to an external address")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Recipient Address")
                    .foregroundColor(.gray)
                RoundedRectangle(cornerRadius: 8)
                    .frame(height: 50)
                    .foregroundColor(Color.gray.opacity(0.1))
                    .overlay(HStack {
                        Text("Enter address")
                            .foregroundColor(.gray)
                        Spacer()
                        Image(systemName: "qrcode")
                            .foregroundColor(.black)
                    }.padding())
                
                Text("Amount to Send")
                    .foregroundColor(.gray)
                RoundedRectangle(cornerRadius: 8)
                    .frame(height: 50)
                    .foregroundColor(Color.gray.opacity(0.1))
                    .overlay(HStack {
                        Text("Enter amount")
                            .foregroundColor(.gray)
                        Spacer()
                        Text("AEDC")
                            .foregroundColor(.black)
                    }.padding())
                
                Toggle("Include fees", isOn: .constant(true))
                    .toggleStyle(SwitchToggleStyle(tint: .green))
                    .padding(.top, 10)
            }
            .padding()
            
            Button(action: {}) {
                Text("Send")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(12)
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct SendTokenView_preview: PreviewProvider {
    static var previews: some View {
        SendTokenView()
    }
}
