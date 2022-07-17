//
//  ContentView.swift
//  module-2-lesson-2-challenge
//
//  Created by Logan Kells on 7/17/22.
//
/**
 Set up:

 Create a brand new SwiftUI app Xcode project.

 Challenge:

 Build a UI with a label and two buttons below it, side by side.

 Create a new structure to represent a playing card
 - It should keep track of a number from 1 to 13 (representing Ace to King)
 - It should also keep track of the suit (Spades, Clubs, Hearts, Diamonds)
 - Declare a "deck" property in your ContentView.swift that will be used to store many instances of this structure

 When the first button is tapped:
 - Create an instance of your playing card structure and assign it a random number and suit.
 - If this number and suit combination has been generated already, change the label to say: "Generated duplicate card."
 - If the number/suit combination is new, then store this instance in your deck property and change the label to say, "Generated a ____ of ___" where the first blank is the number and second blank is the suit.
 - Bonus points if you change the numbers 1, 11, 12, 13 to their respective names ("Ace", "Jack", "Queen", "King")
 - Example: "Generated a King of Clubs"
 
 When the second button is tapped:
 - Randomly select an instance from your deck property
 - Change the label to say "Drew a ____ of ____" where the first blank is the number and second blank is the suit.
 - Bonus points if you change the numbers 1, 11, 12, 13 to their respective names ("Ace", "Jack", "Queen", "King")
 - Example: "Drew a King of Clubs"
 - If this button is tapped when there are no cards in the deck, display the message: "No cards in the deck."

 I've purposely given less direct instructions in this challenge to allow you more room to think!

 If you get stuck, please see the hints below.

 Don't get discouraged if you can't complete this challenge. It's a definitely on the tougher side. However, attempting it and then seeing the solution, will definitely help you grow!

 Hints:
 If you're having trouble checking whether or not a generated card has been seen before, there are multiple ways to go about it:
 - You can create a separate array to store a string representation of the number/suit combo. Then use the contains method to check that array.
 - Or if you want to use the contains method on your deck array and check if a particular card instance is already in there, you can add a protocol to make your Card structure equatable. Simply declare your Card instance like this: "struct Card: Equatable".

 If you're having trouble getting the string representations of the suits and card numbers, you can create a function that accepts an Int and returns a string. Use an If statement and check the number and return the string representation (such as "Ace")

 Lastly, you can check out the solution project to get some ideas and then try to implement it yourself afterwards!
 */

import SwiftUI

struct PlayingCard: Equatable {
    
    // Each PlayingCard has card, representing Ace to King of 0...13
    // and a suit (spades, clubs, hearts, diamonds)
    var card: Int
    var suit: Int
    
    public init() {
        self.card = Int.random(in: 0...12)
        self.suit = Int.random(in: 0...3)
    }
}

struct CardInfo {
    // This class stores information about card names and suits.
    private let suitWords: [String]
    private let valueToSuit: Dictionary<Int, String>
    private let cardWords: [String]
    private let valueToName: Dictionary<Int, String>
    
    public init() {
        // Suit mapping
        self.suitWords = ["Spades", "Clubs", "Hearts", "Diamonds"]
        self.valueToSuit = Dictionary(uniqueKeysWithValues: zip(0...3, suitWords))
        
        // Card name mapping
        self.cardWords = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
        self.valueToName = Dictionary(uniqueKeysWithValues: zip(0...12, cardWords))
    }
    
    public func getSuit(i: Int) -> String {
        return self.valueToSuit[i]!
    }
    
    public func getName(i: Int) -> String {
        return self.valueToName[i]!
    }
}


struct ContentView: View {
    @State var cardDeck: [PlayingCard] = []
    @State var labelSentence: String = ""
    @State var randomDeckCardIdx: Int = 0
    
    // Playing Card information
    let cardInfo = CardInfo()
        
    var body: some View {
        VStack {
            Spacer()
            
            Label(labelSentence, systemImage: "cloud.rain")

            Spacer()
            HStack {
                Spacer()
                Button {
                    // This button will create a new card randomly, and add it to a deck of cards created.
                    
                    // Create a card instance randomly
                    let newCard = PlayingCard()
                    
                    // Handle the new card
                    if cardDeck.contains(newCard) {
                        // If the new card was already created, show a unique message
                        labelSentence = "Generated duplicate card."
                    } else {
                        // Add the new card to the deck, s
                        cardDeck.append(newCard)
                        // Show message of what the card is.
                        labelSentence = "Generated a \(cardInfo.getName(i: newCard.card)) of \(cardInfo.getSuit(i: newCard.suit))."
                    }
                    
                } label: {
                    Text("Create Card")
                }

                Spacer()
                Button {
                    // This button will randomly select a card from the deck of cards created.
                    if cardDeck.count > 0 {
                        // Select a random card from the deck
                        randomDeckCardIdx = Int.random(in: 0...cardDeck.count - 1)
                        let selectedCard = cardDeck[randomDeckCardIdx]
                        
                        // Display message of what card was randomly selected from the deck.
                        labelSentence = "Drew a \(cardInfo.getName(i: selectedCard.card)) of \(cardInfo.getSuit(i: selectedCard.suit))."
                    } else {
                        labelSentence = "No cards in the deck."
                    }
                    
                    
                } label: {
                    Text("Draw Card")
                }

                Spacer()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
