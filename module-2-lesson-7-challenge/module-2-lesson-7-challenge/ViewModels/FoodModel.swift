//
//  FoodModel.swift
//  module-2-lesson-7-challenge
//
//  Created by Logan Kells on 7/27/22.
//

import Foundation

class FoodViewModel: ObservableObject {
    @Published var pizzas: [Pizza] = [Pizza]()
    var newPizza: Pizza = Pizza(name: "Cheese")
    
    init() {
        pizzas.append(Pizza(name: "Cheese"))
        pizzas.append(Pizza(name: "Pepperoni", topping1: "Onion", topping2: "Pepperoni"))
        pizzas.append(Pizza(name: "Hawaiian", topping1: "Onion", topping2: "Ham", topping3: "Pineapple"))
    }
    
}
