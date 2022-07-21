//
//  ContentView.swift
//  module-2-lesson-3-challenge
//
//  Created by Logan Kells on 7/20/22.
//

// See README.md for requirements.

import SwiftUI

struct ContentView: View {
    // These are the possible words that can be randomly added to the list when button is pressed
    let sourceData: [String] = ["Brass Monkey", "Intergalactic", "So What'cha Want", "Paul Revere", "Egg Man"]
    @State var displayData: [String] = []
    @State var randomSelection: Int = 0
    
    var body: some View {
        VStack {
            NavigationView{
                // Each time the button is tapped, a random word from the array is appended.
                // Each item can be used to navigate when clicked.
                // List init - https://developer.apple.com/documentation/swiftui/list/init(_:id:rowcontent:)-8x1ph
                List(displayData, id: \.self) { value in
                    NavigationLink {
                        Text("Coming soon")
                    } label: {
                        Text(value)
                    }
                }.navigationTitle("Random Songs")
                    .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)
            }
            
            Spacer()
            
            Button {
                // Randomly select a word to append to the list
                randomSelection = Int.random(in: 0...sourceData.count - 1)
                displayData.append(sourceData[randomSelection])
            } label: {
                Text("Tap to add a random item")
                    .foregroundColor(.green)
            }
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
