# iOS Foundations Coding Challenges
This repo contains multiple iOS projects, which are each a small challenge from lessons in iOS Foundations, a project based course from Code with Chris.

See - https://learn.codewithchris.com/courses/foundations

## Challenges

### Module 1 Lesson 12
#### Set up

Create a brand new SwiftUI app Xcode project.

#### Challenge

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

### Module 2 Lesson 2

#### Set up

Create a brand new SwiftUI app Xcode project.

#### Challenge

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

### Module 2 Lesson 3
https://learn.codewithchris.com/courses/take/foundations/texts/19297617-lesson-3-challenge

#### Set up

Start a new Xcode SwiftUI app project.

#### Challenge

Build a UI with a List and a Button below it.

Declare a property that contains an array of 5 strings. These can be any 5 words you want.

Each time the button is tapped, choose a random word from the array and put it in the list.

The number of items in the list should grow as you tap the button. 

### Module 2 Lesson 4

#### Set up

Start a new Xcode SwiftUI app project.

#### Challenge

Build a UI with a List and three Buttons below it.

When the first button is tapped:
- Add a random integer (from 1 to 10) to the List.
- If the integer you added to the List wasn't a 7, then keep adding random integers (from 1 to 10) to the List until you add a 7 to the List.

When the second button is tapped:
- Increase all the integers shown in the List by 1

When the third button is tapped:
- Clear all the numbers from the List.

### Module 2 Lesson 7
This is an MVVM pattern challenge.

#### Set up

Create a brand new SwiftUI project in Xcode 

#### Challenge

Declare a Pizza class to model pizzas. Your class should have the following properties:
- name as a String
- topping1 as a String
- topping2 as a String
- topping3 as a String

Declare a ViewModel and instantiate an array containing 3 instances of your class. Set the values for the properties of the 3 class instances.

In the View (ContentView.swift), create an instance of your ViewModel and display the array of class objects in a SwiftUI List. Each row in your list should display the Pizza name and then underneath the name, display the three toppings horizontally side by side.

Keep this project handy because we'll build upon it in the Lesson 8 challenge.

### Module 2 Lesson 10

#### Set up

Utilize the given module-2-lesson-10-challenge.playground file.

#### Challenge

Complete the implementation of the Book checkOut, checkIn, and searchByTitle functions. The provided "tests" should print the expected results.
