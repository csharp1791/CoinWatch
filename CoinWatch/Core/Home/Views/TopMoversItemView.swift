//
//  TopMoversItemView.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/11/23.
//

import SwiftUI

struct TopMoversItemView: View {
  
  let coin: Coin
  
  var body: some View {
    VStack(alignment: .leading) {
      
      // convert URL to images for coin list section
     AsyncImage(url: URL(string: coin.image)) { phase in
        switch phase {
        case .empty:
          Color.purple.opacity(0.1)
        case .success(let image):
          image
            .resizable()
            .scaledToFit()
            .cornerRadius(8)
        case .failure(_):
          Image(systemName: "icloud.slash")
            .resizable()
            .scaledToFit()
        @unknown default:
          Image(systemName: "exclamationmark.icloud")
        }
      }
      .frame(width: 32, height: 32)
      .cornerRadius(20)
        
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
