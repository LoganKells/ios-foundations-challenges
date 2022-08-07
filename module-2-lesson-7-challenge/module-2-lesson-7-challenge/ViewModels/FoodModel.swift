//
//  FoodModel.swift
//  module-2-lesson-7-challenge
//
//  Created by Logan Kells on 7/27/22.
//

import Foundation

class dataService {
    public static func readData(fileName: String, fileType: String) -> [Pizza] {
        let pizzaData: [Pizza]
        let decoder: JSONDecoder = JSONDecoder()
        
        if let filePath = Bundle.main.path(forResource: fileName, ofType: fileType) {
            let url = URL(fileURLWithPath: filePath)
            
            // Load the file contents
            do {
                let pizzaByteData: Data = try Data(contentsOf: url)
                
                do {
                    pizzaData = try decoder.decode([Pizza].self, from: pizzaByteData)
                    
                    // Add a unique identifier for each item.
                    for pizza in pizzaData {
                        pizza.id = UUID()
                    }
                    return pizzaData
                } catch {
                    print("Error. Could not decode byte data: \n \(error)")
                }
                
            } catch {
                print("Error. Could not read byte data from file at url \"\(url)\": \n \(error)")
            }
        } else {
            print("Error, file not found.")
        }
        // Return an empty [Pizza] array in case the file loading failed.
        return [Pizza]()
    }
}

class FoodViewModel: ObservableObject {
    @Published var pizzas: [Pizza]
    
    // let dataLoader = dataService()

    
    init() {
        // The pizza menu is loaded from the pizzas.json file
        pizzas = dataService.readData(fileName: "pizzas", fileType: "json")
        
    }
    
    func addPizzas() {
        pizzas.append(Pizza(name: "Cheese", toppings: ["Pepperoni", "Onion"], imageName: "hawaiian"))

    }
    
}
