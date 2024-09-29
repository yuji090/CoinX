//
//  ContentView.swift
//  CoinX
//
//  Created by Akhil Bisht on 18/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.background.ignoresSafeArea()
            VStack(spacing :40){
                Text("Accent color")
                    .foregroundColor(Color.theme.accent)
                
                Text("Secondary Text Color")
                    .foregroundColor(Color.theme.secondaryText)
                
                Text("Red Color")
                    .foregroundColor(Color.theme.red)
                
                Text("Green Color")
                    .foregroundColor(Color.theme.green)
            }.font(.headline)
        }
        VStack(){
            Text("ds")
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
        NavigationView {
            NavigationLink(destination: HomeView()) {
                Text("Go to Detail")
            }
        }

    }
}

#Preview {
    ContentView()
}
