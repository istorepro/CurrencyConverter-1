//
//  FixerAPI.swift
//  Currency Converter
//
//  Created by Daniel Baldwin on 8/2/16.
//  Copyright © 2016 Daniel Baldwin. All rights reserved.
//

import Foundation
import Alamofire

public class FixerAPI {
    
    public static let baseURL: String = "https://api.fixer.io"
    
    public enum Endpoints {
        
        case ExchangeRatesUSD
        
        public var method: Alamofire.Method {
            switch self {
            case .ExchangeRatesUSD:
                 return Alamofire.Method.GET
            }
        }
        
        public var path: String {
            switch self {
            case .ExchangeRatesUSD:
                return baseURL+"/latest?base=USD"
            }
        }
    }
    
    // MARK: - Request Methods
    
    public static func request(endpoint: FixerAPI.Endpoints, completionHandler: Response<AnyObject, NSError> -> Void) -> Request {
        let request = Manager.sharedInstance.request(endpoint.method, endpoint.path).responseJSON { response in
            switch response.result {
            case .Failure:
                completionHandler(response)
                break
            
            case .Success:
                completionHandler(response)
                break
            }
        }
        return request
    }
}
