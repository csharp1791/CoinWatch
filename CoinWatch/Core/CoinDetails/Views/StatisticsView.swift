//
//  StatisticsView.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/15/23.
//

import SwiftUI

struct StatisticsView: View {
    var body: some View {
      VStack(alignment: .leading, spacing: 4) {
        Text("Current Price")
          .font(.caption)
        
        Text("$21,536.00")
          .font(.headline)
        
        HStack(spacing: 4) {
          Image(systemName: "triangle.fill")
            .font(.caption)
          
          Text("1.23%")
            .font(.caption)
            .bold()
        }
        .foregroundColor(.green)
      }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
