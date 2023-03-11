//
//  TopMoversView.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/11/23.
//

import SwiftUI

struct TopMoversView: View {
  var body: some View {
    VStack(alignment: .leading) {
      Text("Top Movers")
        .font(.headline)
      
      ScrollView(.horizontal) {
        HStack(spacing: 16) {
          ForEach(0 ..< 5, id: \.self) { _ in
            TopMoversItemView()
          }
        }
      }
    }
    .padding()
  }
}

struct TopMoversView_Previews: PreviewProvider {
  static var previews: some View {
    TopMoversView()
  }
}
