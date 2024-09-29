//
//  CoinXApp.swift
//  CoinX
//
//  Created by Akhil Bisht on 18/09/24.
//

import SwiftUI

@main
struct CoinXApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
