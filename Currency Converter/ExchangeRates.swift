//
//  ExchangeRates.swift
//  Currency Converter
//
//  Created by Daniel Baldwin on 7/30/16.
//  Copyright © 2016 Daniel Baldwin. All rights reserved.
//

import Gloss

// Model class that contains the exchange rate of USD to four different currencies.
public struct ExchangeRates: Decodable {
    
    let pounds: Double?
    let euro: Double?
    let yen: Double?
    let reais: Double?
    
    // MARK: - Init Method
    
    public init?(json: JSON) {
        self.pounds = "rates.GBP" <~~ json
        self.euro = "rates.EUR" <~~ json
        self.yen = "rates.JPY" <~~ json
        self.reais = "rates.BRL" <~~ json
    }
}
