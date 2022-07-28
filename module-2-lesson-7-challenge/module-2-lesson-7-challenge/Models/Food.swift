//
//  FoodModel.swift
//  module-2-lesson-7-challenge
//
//  Created by Logan Kells on 7/27/22.
//

import Foundation

class Pizza: Identifiable {
    var name: String
    var topping1: String
    var topping2: String
    var topping3: String
    
    init(name: String, topping1: String = "", topping2: String = "", topping3: String = "") {
        self.name = name
        self.topping1 = topping1
        self.topping2 = topping2
        self.topping3 = topping3
    }
}
