//
//  ContentView.swift
//  module-1-lesson-12-challenge
//
//  Created by Logan Kells on 7/13/22.
//
/* Set up
 
 Create a brand new SwiftUI app Xcode project.

Challenge

 Build a UI with a Text element and a Button below it.

 The Text element should show a "0".

 Declare a method called increase which will add a random number between 1 and 10 to the number shown in the Text element

 Declare a method called decrease which will subtract a random number between 1 and 10 from the number shown in the Text element

 Initially, each time the button is tapped, call the increase method.

 This will bring the number closer to 50 each time you tap it.

 When the number in the Text element is over 50, then from now on you should call the decrease method each time the button is tapped.

 This will cause the number to start dropping towards 0 with each button tap.

 When the number in the Text element is under 0, then from now on you should call the increase method each time the button is tapped.

 This cycle should repeat itself. Climb to over 50 and then drop to under 0.
 */

import SwiftUI

func increase(n: Int) -> Int {
    let valueRange = 1...10
    return n + Int.random(in: valueRange)
}

func decrease(n: Int) -> Int {
    let valueRange = 1...10
    return n - Int.random(in: valueRange)
}

func buttonModel(n: Int, direction: Int) -> Int {
    if (direction > 0) {
        return increase(n: n)
    } else {
        return decrease(n: n)
    }
}

struct ContentView: View {
    @State var count: Int = 0
    // 1 = increase, -1 = decrease
    @State var countDirection: Int = 1
    let maxValue: Int = 50
    let minValue: Int = 0
    
    var body: some View {
        VStack{
            Spacer()
            
            Text(String(count))
            
            Spacer()
            
            Button(action: {
                // Increase until n > 50. When n > 50, then start decreasing
                if (count >= maxValue) {
                    countDirection = -1
                } else if (count < minValue) {
                    countDirection = 1
                }
                count = buttonModel(n: count, direction: countDirection)
                
            }, label: {
                Text("Click Me")
                
            })
            
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
