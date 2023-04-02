//
//  HomeView.swift
//  CoinWatch
//
// LEARNING TUTORIAL VIA UDEMY
//
//  Created by Cliff Sharp on 3/11/23.
//

import SwiftUI

struct HomeView: View {
  
  @StateObject var viewModel = HomeViewModel()
  
  var body: some View {
    NavigationView {
      ZStack {
        ScrollView(.vertical, showsIndicators: false) {
          
          // top movers view
          TopMoversView(viewModel: viewModel)
          
          Divider()
          
          // all coins view
          AllCoinsView(viewModel: viewModel)
        }
        
        if viewModel.isLoadingData {
          CustomLoadingIndicator()
        }
        
      }.navigationTitle("Live Prices")
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
