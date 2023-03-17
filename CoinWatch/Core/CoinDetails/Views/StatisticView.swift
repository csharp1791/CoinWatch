//
//  StatisticView.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/15/23.
//

import SwiftUI

struct StatisticView: View {
  
  let model: StatisticModel
  
    var body: some View {
      VStack(alignment: .leading, spacing: 4) {
        Text(model.title)
          .font(.caption)
        
        Text(model.value)
          .font(.headline)
        
        if let percentChange = model.percentageChange {
          HStack(spacing: 4) {
            Image(systemName: "triangle.fill")
              .font(.caption)
            
            Text(percentChange.toPercentString())
              .font(.caption)
              .bold()
          }
          .foregroundColor(.green)

        }
      }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
      StatisticView(model: dev.stat2)
    }
}
