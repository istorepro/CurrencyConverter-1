//
//  Rates.swift
//  Currency Converter
//
//  Created by Daniel Baldwin on 10/20/16.
//  Copyright © 2016 Daniel Baldwin. All rights reserved.
//

import Gloss

// Model class that contains the exchange rate of different currencies.
public struct Rates: Decodable {
    
    let pounds: Double?
    let euro: Double?
    let yen: Double?
    let reais: Double?
    
    // MARK: - Init Method
    
    public init?(json: JSON) {
        self.pounds = "GBP" <~~ json
        self.euro = "EUR" <~~ json
        self.yen = "JPY" <~~ json
        self.reais = "BRL" <~~ json
    }
}
