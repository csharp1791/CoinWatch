//
//  StatisticModel.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/16/23.
//

import Foundation

struct StatisticModel: Identifiable {
  
  let id = UUID().uuidString
  let title: String
  let value: String
  let percentageChange: Double?
}
