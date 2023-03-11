//
//  HomeViewModel.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/11/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
  
  
  init() {
    fetchCoinData()
  }
  
  func fetchCoinData() {
    let urlString =
    "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
    
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error {
        print(error.localizedDescription)
        return
      }
      
      if let response = response as? HTTPURLResponse {
        print("Response Code: \(response.statusCode)")
      }
      
      guard let data = data else { return }
      print("Data: \(data)")
      
    }.resume()
  }
}
