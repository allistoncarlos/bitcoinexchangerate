//
//  ViewController.swift
//  BitcoinExchangeRate
//
//  Created by Alliston Aleixo on 11/11/2017.
//  Copyright © 2017 Alliston Aleixo. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import Alamofire_SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var exchangeRate: UILabel!
    @IBOutlet weak var dateOccurency: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BitcoinService.shared.getExchangeRate { bitcoinExchange in
            self.exchangeRate.text = bitcoinExchange.last.currency
            self.dateOccurency.text = bitcoinExchange.date.formattedValue
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

