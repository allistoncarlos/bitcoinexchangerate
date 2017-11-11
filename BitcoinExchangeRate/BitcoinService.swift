//
//  BitcoinService.swift
//  BitcoinExchangeRate
//
//  Created by Alliston Aleixo on 11/11/2017.
//  Copyright © 2017 Alliston Aleixo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON

class BitcoinService {
    private let URL = "http://mercadobitcoin.net/api/BTC/ticker/"
    
    static let shared = BitcoinService()
    
    func getExchangeRate(success: @escaping (BitcoinResult) -> Void) {
        Alamofire.request(URL).responseSwiftyJSON { dataResponse in
            if (dataResponse.response?.statusCode == 200) {
                let json = dataResponse.value?["ticker"]
                success(BitcoinResult(json!))
            }
        }
    }
}
