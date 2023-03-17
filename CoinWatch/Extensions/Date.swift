//
//  Date.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/17/23.
//

import Foundation

extension Date {
  
  init(coinGeckoString: String) {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.$$$Z"
    let date = formatter.date(from: coinGeckoString) ?? Date()
    
    self.init(timeInterval: 0, since: date)
  }
}
