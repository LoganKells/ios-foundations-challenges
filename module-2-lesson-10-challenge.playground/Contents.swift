
// The Library Challenge
//
// Instructions:
// Complete the Library class definition so that you get the expected output in the console (specified below the class definitions). See TODOs.
//

class Person {
    
    var name:String!
    
    init(_ fullName:String) {
        name = fullName
    }
}

class Book {
    
    var title:String!
    var author:String!
    
    init(_ bookTitle:String, _ bookAuthor:String) {
        self.title = bookTitle
        self.author = bookAuthor
    }
    
}

// --- Your code goes below this line ---

class Library {
    // This manages the catalogue of available books
    var catalogue = ["ORW": Book("1984", "George Orwell"),
                     "RAY": Book("Fahrenheit 451", "Ray Bradbury")]
    var titles = ["1984": "ORW",
                  "Fahrenheit 451": "RAY"]
    
    // This manages the status of a book.
    var checkedOutBooks = [String:Person]()
    
    func searchByTitle(_ title:String) -> String {
        
        // TODO: This function searches the catalogue dictionary for a title
        //
        // Returns "Available" if the book exists and isn't checked out
        //
        // Returns "Checked out by name" if the book exists and is checked out
        //
        // Returns "Not in catalogue" if the book doesn't exist
        var bookStatus: String
        
        // Get the book id to search the catalogue
        if let bookId = titles[title] {
            if let bookData: Book = catalogue[bookId] {  // Optional binding
                if let personWithBook: Person = checkedOutBooks[bookId] {
                    let personName = personWithBook.name!
                    bookStatus = "Checked out by \(personName)"
                } else {
                    bookStatus = "Available"
                }
            } else {
                bookStatus = "Not in catalogue"
            }
        } else {
            bookStatus = "Not in catalogue"
        }
        
        return bookStatus
    }
    
    func checkOut(_ bookId:String, _ person:Person) -> String {
        
        // TODO: This function adds to the checkedOutBooks dictionary
        //
        // Returns "Error: Book already checked out" if the book is already in the checkedOutBooks dictionary
        //
        // Returns "Successfully checked out" and adds the bookId,person key-value pair if the book doesn't currently exist in the checkedOutbooks dictionary
        //
        // Returns "Book doesn't exist" if the book isn't in the catalogue dictionary
        var bookStatus: String
        
        if let bookData: Book = catalogue[bookId] {
            // If the book exists in the catalogue, we can proceed to try to check it out.
            if let personWithBook: Person = checkedOutBooks[bookId] {
                // If the book is already checked out, return a message
                bookStatus = "Error: Book already checked out"
            } else {
                // If the book exists in the catalogue, and is not checked out, then add it to the checkedOutBooks
                checkedOutBooks[bookId] = person
                bookStatus = "Successfully checked out"
            }
        } else {
            bookStatus = "Book doesn't exist"
        }
        return bookStatus
    }
    
    func checkIn(_ bookId:String) -> String {
        
        // TODO: This function removes the bookId,person key-value pair from the checkedOutBooks dictionary
        //
        // Returns "Book doesn't exist" if the book isn't in the catalogue dictionary
        //
        // Returns "Error: Can't check in a book that hasn't been checked out" if the book wasn't checked out in the first place
        //
        // Returns "Successfully checked in"
        var bookStatus: String
        
        if let bookData: Book = catalogue[bookId] {
            // If the book exists in the catalogue, we can proceed to try to check it in.
            if let personWithBook: Person = checkedOutBooks[bookId] {
                // If the book is already checked out, then now it can be checked in.
                checkedOutBooks[bookId] = nil
                bookStatus = "Successfully checked in"
            } else {
                // If the book exists in the catalogue, and is not checked out, then technically it cannot be checked in
                bookStatus = "Error: Can't check in a book that hasn't been checked out"
            }
        } else {
            bookStatus = "Book doesn't exist"
        }
        return bookStatus
    }
    
}
// --- Your code goes above this line ---

// --- Don't edit or add anything below this line ---

let lib = Library()
let borrower1 = Person("Curious George")
let borrower2 = Person("Mark Twain")

print("1)")
// George searches for a book
// Expected Output in console:
// "Available"
print("Expected: Available")
let searchResult = lib.searchByTitle("1984")
print("Got:      \(searchResult) \n")


print("2)")
// George checks out the book
// Expected Output in console:
// "Successfully checked out"
print("Expected: Successfully checked out")
let borrowResult = lib.checkOut("ORW", borrower1)
print("Got:      \(borrowResult) \n")


print("3)")
// Mark searches for a book
// Expected Output in console:
// "Checked out by Curious George"
print("Expected: Checked out by Curious George")
let searchResult2 = lib.searchByTitle("1984")
print("Got:      \(searchResult2) \n")

print("4)")
// Mark tries to borrow a book that's already checked out
// Expected Output in console:
// "Error: Book already checked out"
print("Expected: Error: Book already checked out")
let borrowResult2 = lib.checkOut("ORW", borrower2)
print("Got:      \(borrowResult2) \n")



print("5)")
// A book is checked in
// Expected Output in console:
// "Error: Can't check in a book that hasn't been checked out"
print("Expected: Error: Can't check in a book that hasn't been checked out")
let checkInResult = lib.checkIn("RAY")
print("Got:      \(checkInResult) \n")


print("6)")
// George checks in his book
// Expected Output in console:
// "Successfully checked in"
print("Expected: Successfully checked in")
let checkInResult2 = lib.checkIn("ORW")
print("Got:      \(checkInResult2) \n")


print("7)")
// Mark attempts to borrow the book again
// Expected Output in console:
// "Successfully checked out"
print("Expected: Successfully checked out")
let borrowResult3 = lib.checkOut("ORW", borrower2)
print("Got:      \(borrowResult3) \n")


