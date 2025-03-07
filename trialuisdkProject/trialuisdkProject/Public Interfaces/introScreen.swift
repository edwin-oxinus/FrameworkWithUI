//
//  introScreen.swift
//  trialuisdkProject
//
//  Created by Edwin work on 07/03/2025.
//

import SwiftUI
import Combine

/// Any informaton that needs to be used can be passed on here may be via a intializer class that returns anything like a view, fragment, widget etc etc
///
public struct introScreen: View {
    let currentAEDBalance: Double
    
    public init(currentAEDBalance: Double) {
        self.currentAEDBalance = currentAEDBalance
    }
    
    public var body: some View {
        CryptoWalletView(currentAEDBalance: currentAEDBalance)
    }
}

public class CryptoInfoManager {
    public static let shared = CryptoInfoManager()
    private init() {}
    
    public func fetchStableCoinBalance() -> Double {
        // can make API calls and get the value
        return 8900.00
    }
    
    /// ANY thing that needs to be used by one who consume this can be here.
}

#Preview {
    introScreen(currentAEDBalance: 200000.25)
}
