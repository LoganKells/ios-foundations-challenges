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
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.pizzas) { pizzaType in
                            HStack {
                                // Show an image of each pizza to the left of the pizza name
                                Image(pizzaType.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 55, height: 55, alignment: .center)
                                    .clipped()
                                    .cornerRadius(6)
                                VStack(alignment: .leading){
                                    // Show horizontal stack of toppings for each pizza below the Pizza Name.
                                    Text(pizzaType.name)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    
                                    HStack{
                                        ForEach(0..<pizzaType.toppings.count, id: \.self) { i in
                                            Text(pizzaType.toppings[i])
                                                .font(.caption)
                                                .fontWeight(.light)
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                    
                }.navigationTitle("Pizza Menu")
                    .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)

                
            }.navigationViewStyle(.stack)
            HStack {
                Button("Add pizzas") {
                    viewModel.addPizzas()
                }
                Button("Add Pineapple") {
                    for pizza in viewModel.pizzas {
                        pizza.toppings.append("Pineapple")
                    }
                    
                    // Note, while the Pizza array is @Published, the value change for each Pizza instances is not identified in SwiftUI.
                    // Workaround is to pop a value from the array, then push.
                    if let lastPizza = viewModel.pizzas.popLast() {
                        viewModel.pizzas.append(lastPizza)
                    } else {
                        print("No pizza to add pineapple")
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
