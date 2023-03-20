//
//  Double.swift
//  CoinWatch
//
//  Created by Cliff Sharp on 3/14/23.
//

import Foundation

extension Double {
  
  private var currencyFormatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.usesGroupingSeparator = true
    formatter.numberStyle = .currency
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    return formatter
  }
  
  private var numberFormatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    return formatter
  }

  
  func toCurrency() -> String {
    return currencyFormatter.string(for: self) ?? "$0.00"
  }
  
  func toPercentString() -> String {
    guard let numberAsString = numberFormatter.string(for: self) else { return "" }
    return numberAsString + "%"
  }
  
  func asNumberString() -> String {
    return String(format: "%.2f", self)
  }
 
/*
  convert -1234 5o -1.34k
  concert 123456 to 123.45k
 */
  
  func formattedWithAbbreviations() -> String {
    
    let num = abs(Double(self))   // self is the number we are looking at
    let sign = (self < 0) ? "-" : ""
    
    switch num {
    case 1_000_000_000_000...:
      let formatted = num / 1_000_000_000_000
      let stringFormatted = formatted.asNumberString()
      return "\(sign)\(stringFormatted)Tr"
    case 1_000_000_000...:
      let formatted = num / 1_000_000_000
      let stringFormatted = formatted.asNumberString()
      return "\(sign)\(stringFormatted)Bn"
    case 1_000_000...:
      let formatted = num / 1_000_000
      let stringFormatted = formatted.asNumberString()
      return "\(sign)\(stringFormatted)M"
    case 1_000...:
      let formatted = num / 1_000
      let stringFormatted = formatted.asNumberString()
      return "\(sign)\(stringFormatted)k"
    case 0...:
      return self.asNumberString()
    default:
      return "\(sign)\(self)"
    }
  }
  
}
