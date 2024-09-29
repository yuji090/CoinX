//
//  HomeViewModel.swift
//  CoinX
//
//  Created by Akhil Bisht on 29/09/24.
//

import Foundation

class HomeViewModel: ObservableObject{
    
    @Published var allcoins : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.allcoins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
}
