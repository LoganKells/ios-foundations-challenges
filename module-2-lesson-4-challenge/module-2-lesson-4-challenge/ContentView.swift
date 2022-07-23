//
//  ContentView.swift
//  module-2-lesson-4-challenge
//
//  Created by Logan Kells on 7/20/22.
//

import SwiftUI

struct ContentView: View {
    @State var viewData: [Int] = []
    
    var body: some View {
        VStack {
            Spacer()
            
            NavigationView {
                List(viewData, id: \.self) { value in
                    Text(String(value))
                }.navigationTitle("Random Integers")
                    .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Button {
                    // Add a random integer from 1-10 to the list when this button is tapped.
                    // Keep adding random integers until the value 7 is added to the list, then stop.
                    var newValue: Int = -1
                    repeat {
                        newValue = Int.random(in: 0...10)
                        viewData.append(newValue)
                        
                    } while newValue != 7
                    
                    print("Button 1 clicked")
                } label: {
                    Text("Add Values")
                }.padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                
                Spacer()
                Button {
                    // Increase every value by +1
                    // Note - this is a demo of loops, where vector arithmatic would be better suited.
                    for (i, n) in viewData.enumerated() {
                        viewData[i] = n + 1
                    }
                    print("Button 2 clicked")
                } label: {
                    Text("Value += 1")
                }.padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                Spacer()
                Button {
                    // Remove all values from the list when this button is used.
                    viewData.removeAll()
                    print("Button 3 clicked")
                } label: {
                    Text("Clear")
                }.padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                Spacer()

            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
