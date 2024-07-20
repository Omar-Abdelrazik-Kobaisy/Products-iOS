//
//  Double+Ext.swift
//  Products-iOS
//
//  Created by Omar on 20/07/2024.
//

import Foundation

extension Double{
    
    private var currencyFormatter6: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
//        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    ///Convert Double into Currency Formate
    ///```
    ///Convert 1234.56 to $1,234.56
    ///Convert 1.23456789 to $1.234567
    ///```
    func toCurrencyFormate6() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "0.00"
    }
    private var currencyFormatter2: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
//        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    ///Convert Double into Currency Formate
    ///```
    ///Convert 1234.56 to $1,234.56
    ///Convert 1.23456789 to $1.23
    ///```
    func toCurrencyFormate2() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "0.00"
    }
    
    func asNumberString() -> String{
        String(format: "%.1f", self)
    }
    
    ///Convert Double into String representation with percent Symbol
    ///```
    ///Convert 1.23456789 to 1.23%
    ///```
    func asPercentString() -> String{
        asNumberString() + "%"
    }
}
