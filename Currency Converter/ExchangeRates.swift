//
//  ExchangeRates.swift
//  Currency Converter
//
//  Created by Daniel Baldwin on 7/30/16.
//  Copyright © 2016 Daniel Baldwin. All rights reserved.
//

import Gloss

// Model class that contains the base currency and the date, along with a submodel of the exchange rates
public struct ExchangeRates: Decodable {
    
    let base: String?
    let date: String?
    let rates: Rates?
    
    // MARK: - Init Method
    
    public init?(json: JSON) {
        
        self.base = "base" <~~ json
        self.date = "date" <~~ json
        self.rates = "rates" <~~ json
    }
}
