//
//  HomeView.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/11/23.
//

import SwiftUI

struct HomeView: View {
  
  @StateObject var viewModel = HomeViewModel()
  
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        
        // top movers view
        TopMoversView()
        
        Divider()
        
        // all coins view
        AllCoinsView()
      }
      .navigationTitle("Live Prices")
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
