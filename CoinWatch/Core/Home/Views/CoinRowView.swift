//
//  CoinRowView.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/11/23.
//

import SwiftUI

struct CoinRowView: View {
  
  let coin: Coin
    
    var body: some View {
      HStack {
        // market cap rank
        Text("\(coin.marketCapRank)")
          .font(.caption)
          .foregroundColor(.gray)
          .padding(.trailing, 2)
  
        // convert URL to images for market cap rank section
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
   
        // coin name info
        VStack(alignment: .leading, spacing: 4) {
          Text(coin.name)
            .font(.subheadline)
            .fontWeight(.semibold)
            .padding(.leading, 4)
          
          Text(coin.symbol.uppercased())
            .font(.caption)
            .padding(.leading, 6)
        }
        .foregroundColor(Color.theme.primaryTextColor)
        .padding(.leading, 2)
        
        Spacer()
        
        // coin price info
        VStack(alignment: .trailing, spacing: 4) {
          Text(coin.currentPrice.toCurrency())
            .font(.subheadline)
            .fontWeight(.semibold)
            .padding(.leading, 4)
            .foregroundColor(Color.theme.primaryTextColor)
          
          Text(coin.priceChangePercentage24H.toPercentString())
            .font(.caption)
            .padding(.leading, 6)
            .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
        }
        .padding(.leading, 2)
      }
      .padding(.horizontal)
      .padding(.vertical, 4)
    }
}
/*
struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
      CoinRowView(coin: coin)
    }
}*/
