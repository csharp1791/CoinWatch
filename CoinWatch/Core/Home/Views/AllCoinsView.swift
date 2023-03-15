//
//  AllCoinsView.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/11/23.
//

import SwiftUI

struct AllCoinsView: View {
  
  @StateObject var viewModel: HomeViewModel
  
  var body: some View {
    VStack (alignment: .leading) {
      Text("All Coins")
        .font(.headline)
        .padding()
      
      HStack {
        Text("Coin")
        
        Spacer()
        
        Text("Prices")
      }
      .foregroundColor(.gray)
      .font(.caption)
      .padding(.horizontal)
      
      ScrollView {
        VStack {
          ForEach(viewModel.coins) { coin in
            NavigationLink {
              CoinDetailsView()
            } label: {
              CoinRowView(coin: coin)
            }

          }
        }
      }
    }
  }
}
/*
struct AllCoinsView_Previews: PreviewProvider {
  static var previews: some View {
    AllCoinsView()
  }
}*/
