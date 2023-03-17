//
//  CoinDetailsView.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/15/23.
//

import SwiftUI

struct CoinDetailsView: View {
  
  let viewModel: CoinDetailsViewModel
  
  init(coin: Coin) {
    self.viewModel = CoinDetailsViewModel(coin: coin)
  }
  
    var body: some View {
      NavigationView() {
        ScrollView {
          
          // chart
          ChartView(viewModel: viewModel)
            .frame(height: 250)
            .padding(.vertical)
          
          // overview
          CoinDetailsSection(model: viewModel.overviewSectionModel)
            .padding(.vertical)
          
          // additonal details
          CoinDetailsSection(model: viewModel.additionalDetailsSectionModel)
            .padding(.vertical)

        }
        .navigationTitle("Bitcoin")
        .padding()
      }
    }
}

struct CoinDetailsView_Previews: PreviewProvider {
    static var previews: some View {
      CoinDetailsView(coin: dev.coin)
    }
}
