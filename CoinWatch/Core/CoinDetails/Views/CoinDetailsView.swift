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
    ScrollView(showsIndicators: false) {
      
      // chart
      ChartView(viewModel: viewModel)
        .frame(height: 250)
        .padding(.vertical)
        .shadow(color: viewModel.chartLineColor, radius: 10)
        .shadow(color: viewModel.chartLineColor.opacity(0.5), radius: 10)
      
      // overview
      CoinDetailsSection(model: viewModel.overviewSectionModel)
        .padding(.vertical)
      
      // additonal details
      CoinDetailsSection(model: viewModel.additionalDetailsSectionModel)
        .padding(.vertical)
      
    }
    .navigationTitle(viewModel.coinName)
    .padding()
  }
}

struct CoinDetailsView_Previews: PreviewProvider {
    static var previews: some View {
      CoinDetailsView(coin: dev.coin)
    }
}
