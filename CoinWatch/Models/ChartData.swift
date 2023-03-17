//
//  ChartData.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/17/23.
//

import Foundation

struct ChartData: Identifiable {
  let id = UUID().uuidString
  let date: Date
  let value: Double
}
