//
//  LazyNavigationView.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/20/23.
//

import SwiftUI

struct LazyNavigationView<Content: View> : View {
  
  let build: () -> Content
  
  init(_ build: @autoclosure @escaping() -> Content) {
    self.build = build
  }
  
  var body: Content {
    build()
  }
}
