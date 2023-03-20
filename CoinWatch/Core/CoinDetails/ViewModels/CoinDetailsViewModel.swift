//
//  CoinDetailViewModel.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/17/23.
//

import SwiftUI

class CoinDetailsViewModel {
  
  private let coin: Coin
  
  // chart config
  var chartData = [ChartData]()
  var startDate = Date()
  var endDate = Date()
  var minPrice = 0.0
  var maxPrice = 0.0
  var xAxisValues = [Date]()
  var yAxisValues = [Double]()
  
  var coinName: String {
    return coin.name
  }
  
  var chartLineColor: Color {
    let priceChange = (coin.sparklineIn7D?.price.last ?? 0.0) -
    (coin.sparklineIn7D?.price.first ?? 0.0)
    return priceChange > 0 ? .green : .red
  }
  
  var overviewSectionModel: CoinDetailSectionModel {
    
    // price stats
    let price = coin.currentPrice.toCurrency()
    let pricePercentageChange = coin.priceChangePercentage24H
    let priceStats = StatisticModel(title: "Current Price", value: price, percentageChange: pricePercentageChange)
    
    // market cap stats
    let marketCap = coin.marketCap ?? 0.0
    let marketCapPercentChange = coin.marketCapChangePercentage24H
    let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap.formattedWithAbbreviations(), percentageChange: marketCapPercentChange)
    
    // rank stats
    let rank = coin.marketCapRank
    let rankStat = StatisticModel(title: "Rank", value: "\(rank)", percentageChange:  nil)
    
    // volume stats
    let volume = coin.totalVolume ?? 0.0
    let volumeStat = StatisticModel(title: "Volume", value: volume.formattedWithAbbreviations(), percentageChange: nil)
    
    return CoinDetailSectionModel(title: "Overview", stats: [priceStats, marketCapStat, rankStat, volumeStat])
  }
  
  var additionalDetailsSectionModel: CoinDetailSectionModel {
    
    // 24H high
    let high = coin.high24H?.toCurrency() ?? "0.0"
    let highStat = StatisticModel(title: "24H High", value: high, percentageChange: nil)
    
    // 24H Low
    let low = coin.low24H?.toCurrency() ?? "0.0"
    let lowStat = StatisticModel(title: "24H Low", value: low, percentageChange: nil)
    
    // 24H price change
    let priceChange24H = coin.priceChange24H.toCurrency()
    let percentChange24H = coin.priceChangePercentage24H
    let priceChangeStat = StatisticModel(title: "24H PriceChange", value: priceChange24H, percentageChange: percentChange24H)
    
    // 24H market cap change
    let marketCapChange = coin.marketCapChange24H ?? 0.0
    let marketCapChangePercent = coin.marketCapChangePercentage24H
    let marketStat = StatisticModel(title: "24H Market Cap Change", value: "$\(marketCapChange.formattedWithAbbreviations())", percentageChange: marketCapChangePercent)
    
    return CoinDetailSectionModel(title: "Additional Details", stats: [highStat, lowStat, priceChangeStat,  marketStat])
  }
  
  
  init(coin: Coin) {
    self.coin = coin
    configureChartData()
  }
  
  func configureChartData() {
    guard let priceData = coin.sparklineIn7D?.price else { return }
    var index = 0
    
    self.minPrice = priceData.min()!
    self.maxPrice = priceData.max()!
    self.endDate = Date(coinGeckoString: coin.lastUpdated ?? "")
    self.startDate = endDate.addingTimeInterval(-7 * 60 * 60 * 24)
    self.yAxisValues = [minPrice, (minPrice + maxPrice) / 2, maxPrice]
    self.xAxisValues = [startDate, endDate]
//
    for price in priceData.reversed() {
      
      let date = endDate.addingTimeInterval(-1 * 60 * 60 * Double(index))
      
      let chartDataItem = ChartData(date: date, value: price)
      self.chartData.append(chartDataItem)
      index += 1
    }
  }
  
  /*
   The above code can be done in an easier, but will address later.
   need to figure out date for each price point
    i               - index in price array
   [10, 20, 30, 40] - price
   [40, 30, 20, 10] - reversed
   [4,  3,  2,  1 ] - which hour in list of prices
   [(4, 40)]        - char data (result)
   */
  
}
