//
//  TopMoversItemView.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/11/23.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
  
  let coin: Coin
  
  var body: some View {
    VStack(alignment: .leading) {
      // image
      
      KFImage(URL(string: coin.image))
        .resizable()
        .scaledToFit()
        .frame(width: 32, height: 32)
        .padding(.leading, 0)

      // coin info
      HStack(spacing: 2) {
        Text(coin.symbol.uppercased())
          .font(.caption)
          .fontWeight(.bold)
          .foregroundColor(Color.theme.primaryTextColor)
        
        Text(coin.currentPrice.toCurrency())
          .font(.caption)
          .foregroundColor(.gray)
      }
      
      // percentage change
      Text(coin.priceChangePercentage24H.toPercentString())
        .font(.title2)
        .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
    }
    .frame(width: 140, height: 140)
    .background(Color.theme.itemBackgroundColor)
    .overlay(
      RoundedRectangle(cornerRadius: 10)
        .stroke(Color(.systemGray4), lineWidth: 2)
    )
  }
  
}
/*
struct TopMoversItemView_Previews: PreviewProvider {
  static var previews: some View {
    TopMoversItemView()
  }
}*/
