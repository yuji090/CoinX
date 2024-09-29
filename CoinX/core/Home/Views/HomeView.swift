//
//  HomeView.swift
//  CoinX
//
//  Created by Akhil Bisht on 19/09/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var ShowPortfolio: Bool = false
    
    var body: some View {
        ZStack{
            //background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack{
                homeview
                
                if !ShowPortfolio{
                    
                }
                if ShowPortfolio{
                    
                }
                List{
                 // CoinRowView(coin: DeveloperPreview.instance.coin, showholdingscolumn: false)
                    ForEach(vm.allcoins){
                        coim in CoinRowView(coin: coim, showholdingscolumn: false)
                            .listRowInsets(.init(top :10, leading: 0, bottom: 10, trailing: 10))
                    }
                }
                .listStyle(PlainListStyle())
                                
                Spacer(minLength: 0)
            }
        }
        .navigationTitle(".") // This reserves space for the navigation bar
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}

extension HomeView {
    private var homeview : some View{
        HStack{
            CircleButtonView(iconName: ShowPortfolio ? "plus" : "info")
                .animation(nil, value: ShowPortfolio)
                .background(
                CircleButtonAnimationView(animate: $ShowPortfolio))
            Spacer()
            Text(ShowPortfolio ? "Portfolio" : "Live Prices")
                .animation(nil, value: ShowPortfolio)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: ShowPortfolio ? 180:0))
                .onTapGesture {
                    withAnimation(.spring()){
                        ShowPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)

    }
}
