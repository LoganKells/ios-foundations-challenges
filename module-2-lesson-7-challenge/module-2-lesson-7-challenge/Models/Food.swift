//
//  FoodModel.swift
//  module-2-lesson-7-challenge
//
//  Created by Logan Kells on 7/27/22.
//

import Foundation

class Pizza: Identifiable, Decodable {
    var id: UUID?
    var name: String
    var toppings: [String]
    var imageName: String
    
    init(name: String, toppings: [String], imageName: String) {
        self.name = name
        self.toppings = toppings
        self.imageName = imageName
    }
}
