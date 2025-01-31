//
//  CoinRowView.swift
//  CoinX
//
//  Created by Akhil Bisht on 26/09/24.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin : CoinModel
    let showholdingscolumn : Bool
    
    var body: some View {
        HStack(spacing: 0){
            leftColumn
            Spacer()
            if showholdingscolumn{
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
        
    }
}

struct CoinRowView_Previews: PreviewProvider{
    static var previews: some View{
        CoinRowView(coin: dev.coin, showholdingscolumn: true)
            .previewLayout(.sizeThatFits)
    }
}



extension CoinRowView{
    
    private var leftColumn : some View{
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30,height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)

        }
    }
    
    private var centerColumn : some View{
        VStack(alignment : .trailing){
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)

    }
    
    private var rightColumn : some View{
        VStack(alignment : .trailing){
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24HInCurrency ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
        }
        .frame(width: UIScreen.main.bounds.width/3.5 , alignment: .trailing)
    }
}
