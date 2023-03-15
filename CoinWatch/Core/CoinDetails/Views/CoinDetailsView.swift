//
//  CoinDetailsView.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/15/23.
//

import SwiftUI

struct CoinDetailsView: View {
    var body: some View {
      NavigationView() {
        ScrollView {
          
          // chart
          
          // overview
          CoinDetailsSection()
            .padding(.vertical)
          
          // additonal details
          CoinDetailsSection()
            .padding(.vertical)

          Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .navigationTitle("Bitcoin")
        .padding()
      }
    }
}

struct CoinDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsView()
    }
}
