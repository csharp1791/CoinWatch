//w
//  ChartView.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/17/23.
//

import SwiftUI
import Charts

struct ChartView: View {
  
  let viewModel: CoinDetailsViewModel
  
  var body: some View {
    Chart {
      ForEach(viewModel.chartData) { item in
        LineMark(x: .value("Date", item.date), y: .value("Price", item.value))
          .interpolationMethod(.cardinal)
      }
    }
    .chartXScale(domain: ClosedRange(uncheckedBounds: (lower: viewModel.startDate, upper: viewModel.endDate)))
    .chartXAxis {
      AxisMarks(position: .bottom, values: viewModel.xAxisValues)
    }
    
    .chartYScale(domain: ClosedRange(uncheckedBounds: (lower: viewModel.minPrice, upper: viewModel.maxPrice)))
    .chartYAxis {
      AxisMarks(position: .leading, values: viewModel.yAxisValues)
    }

  }
}

struct ChartView_Previews: PreviewProvider {
  static var previews: some View {
    ChartView(viewModel: CoinDetailsViewModel(coin: dev.coin))
  }
}
