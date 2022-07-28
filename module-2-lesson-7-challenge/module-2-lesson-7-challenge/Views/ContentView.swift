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
                List(viewModel.pizzas) { pizzaType in
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
            }
            Button("Add Pineapple") {
                for pizza in viewModel.pizzas {
                    pizza.topping1 = "Pineapple"
                }
                
                // Note, while the Pizza array is @Published, the value change is not
                // identified in SwiftUI.
                // Workaround is to pop a value from the array, then push.
                let lastPizza: Pizza = viewModel.pizzas.popLast()!
                viewModel.pizzas.append(lastPizza)
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
