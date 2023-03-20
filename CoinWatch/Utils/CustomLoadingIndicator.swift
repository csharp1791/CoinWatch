//
//  CustomLoadingIndicator.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/20/23.
//

import SwiftUI

struct CustomLoadingIndicator: View {
  var body: some View {
    ProgressView()
      .progressViewStyle(.circular)
      .accentColor(.white)
      .scaleEffect(x: 1.5, y: 1.5, anchor: .center)
      .frame(width: 80, height: 80)
      .background(Color(.systemGray4))
      .cornerRadius(20)
  }
}

struct CustomLoadingIndicator_Previews: PreviewProvider {
  static var previews: some View {
    CustomLoadingIndicator()
  }
}
