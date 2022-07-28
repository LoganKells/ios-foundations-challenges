//
//  ContentView.swift
//  module-2-lesson-7-challenge
//
//  Created by Logan Kells on 7/27/22.
//

import SwiftUI

struct ContentView: View {
    var viewModel = FoodViewModel()
    
    var body: some View {
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
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
