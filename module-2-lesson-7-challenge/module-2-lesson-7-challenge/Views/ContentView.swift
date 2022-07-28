//
//  ContentView.swift
//  module-2-lesson-7-challenge
//
//  Created by Logan Kells on 7/27/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = FoodViewModel()
    
    var body: some View {
        VStack {
            NavigationView {
                if viewModel.pizzas != nil {
                    List(viewModel.pizzas!) { pizzaType in
                        VStack(alignment: .leading) {
                            Text(pizzaType.name)
                                .font(.title)
                            HStack(alignment: .bottom) {
                                Text(pizzaType.topping1)
                                Spacer()
                                Text(pizzaType.topping2)
                                Spacer()
                                Text(pizzaType.topping3)
                                Spacer()
                            }
                        }
                    }.navigationTitle("Pizza Menu")
                        .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)
                } else {
                    Text("Click the \"Add pizzas\" button.")
                }
                
            }
            HStack {
                Button("Add pizzas") {
                    if viewModel.pizzas == nil {
                        // Create an array of Pizza and populate with some values.
                        viewModel.pizzas = [Pizza]()
                        viewModel.addPizzas()
                    }
                }
                Button("Add Pineapple") {
                    if viewModel.pizzas != nil {
                        for pizza in viewModel.pizzas! {
                            pizza.topping1 = "Pineapple"
                        }
                        
                        // Note, while the Pizza array is @Published, the value change for each Pizza instances is not identified in SwiftUI.
                        // Workaround is to pop a value from the array, then push.
                        if let lastPizza = viewModel.pizzas?.popLast() {
                            viewModel.pizzas?.append(lastPizza)
                        } else {
                            print("No pizza to add pineapple")
                        }
                    }
                    
                    
                }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
