//
//  FoodModel.swift
//  module-2-lesson-7-challenge
//
//  Created by Logan Kells on 7/27/22.
//

import Foundation

class FoodViewModel: ObservableObject {
    @Published var pizzas: [Pizza]?
    var decoder: JSONDecoder = JSONDecoder()
    
    init() {
        // The pizza menu is loaded from the pizzas.json file
        if let filePath = Bundle.main.path(forResource: "pizzas", ofType: "json") {
            let url = URL(fileURLWithPath: filePath)
            
            // Load the file contents
            do {
                let pizzaByteData: Data = try Data(contentsOf: url)
                
                do {
                    let pizzaData: [Pizza] = try decoder.decode([Pizza].self, from: pizzaByteData)
                    
                    for pizza in pizzaData {
                        pizza.id = UUID()
                        print(pizza.name, pizza.toppings)
                    }
                    //print("pizzaData: \(pizzaData)")
                    
                    self.pizzas = pizzaData
                } catch {
                    print("Error. Could not decode byte data: \n \(error)")
                }
                
            } catch {
                print("Error. Could not read byte data from file at url \"\(url)\": \n \(error)")
            }
        } else {
            print("Error, file not found.")
        }
        
    }
    
    func addPizzas() {
        pizzas?.append(Pizza(name: "Cheese", toppings: ["Pepperoni", "Onion"]))
    }
    
}
