//
//  Wage.swift
//  Window-Shopper
//
//  Created by Benjamin Jakob on 24.10.17.
//  Copyright © 2017 BenJakob. All rights reserved.
//

import Foundation

class Wage {
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price / wage))
    }
}
