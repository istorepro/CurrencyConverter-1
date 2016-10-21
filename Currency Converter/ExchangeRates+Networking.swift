//
//  ExchangeRates+Networking.swift
//  Currency Converter
//
//  Created by Daniel Baldwin on 8/2/16.
//  Copyright © 2016 Daniel Baldwin. All rights reserved.
//

import Alamofire
import Gloss

// extension of model class that adds networking call
extension ExchangeRates {
    
    public static func fetch(completion:(result: ExchangeRates?, error: NSError?) -> Void) {
        FixerAPI.request(.ExchangeRatesUSD) { response in
            switch response.result {
            case .Failure:
                completion(result: nil, error: response.result.error)
            case .Success:
                if let JSON = response.result.value as? JSON {
                    completion(result: ExchangeRates(json: JSON), error: nil)
                }
            }
        }
    }
}
