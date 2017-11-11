//
//  BitcoinResult.swift
//  BitcoinExchangeRate
//
//  Created by Alliston Aleixo on 11/11/2017.
//  Copyright © 2017 Alliston Aleixo. All rights reserved.
//

import Foundation
import SwiftyJSON

class BitcoinResult: Codable {
    var high: Double
    var low: Double
    var vol: Double
    var last: Double
    var buy: Double
    var sell: Double
    var date: Date
    
    init(_ json: JSON) {
        high    = json["high"].doubleValue
        low     = json["low"].doubleValue
        vol     = json["vol"].doubleValue
        last    = json["last"].doubleValue
        buy     = json["buy"].doubleValue
        sell    = json["sell"].doubleValue
        
        date    = Date(jsonDate: json["date"].stringValue)!
    }
}

extension Date {
    init?(jsonDate: String) {
        guard let milliSeconds = Double(jsonDate) else { return nil }
        
        self.init(timeIntervalSince1970: milliSeconds)
    }
    
    var formattedValue: String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        
        return dateFormatter.string(from: self)
    }
}

extension Double {
    var currency: String { return String(format: "R$ %.02f", self) }
}
