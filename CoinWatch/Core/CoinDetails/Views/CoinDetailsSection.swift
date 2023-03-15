//
//  CoinDetailsSection.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/15/23.
//

import SwiftUI

struct CoinDetailsSection: View {
  
  private let columns: [GridItem] = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  
    var body: some View {
      VStack {
        Text("Overview")
          .font(.title).bold()
          .frame(maxWidth: .infinity, alignment: .leading)
        
        LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
          ForEach(0 ..< 4, id: \.self) { _ in
            StatisticsView()
          }
        }
      }
    }
}

struct CoinDetailsSection_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsSection()
    }
}
