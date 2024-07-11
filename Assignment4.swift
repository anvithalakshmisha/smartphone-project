//
//  Assignment4.swift
//  
//
//  Created by Anvitha Lakshmisha on 2/7/24.
//

import Foundation

// Swift Structures

struct Book {
    var title: String
    var pages: Int
    var publicationYear: Int
    var author: String
    
    func displayInfo() -> String {
        return "Title is \(title), Author is \(author), number of pages are \(pages) and the publication year is \(publicationYear)"
    }
}


let book1 = Book(title: "title 1", pages: 123, publicationYear: 1990, author: "Author1");
let book2 = Book(title: "title 2", pages: 13, publicationYear: 1991, author: "Author2");
let book3 = Book(title: "title 3", pages: 132, publicationYear: 1992, author: "Author3");

var info = book3.displayInfo()

print ("Display info of book 3 is \(info)")

// Swift Class

class Shape {
    func area() -> Double {
        return 0.0
    }
    func perimeter() -> Double {
        return 0.0
    }
}

class Rectangle: Shape {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
            self.width = width
            self.height = height
        }
    
    override func area () -> Double {
        return height * width
    }
    
    override func perimeter() -> Double {
        return 2 * (height + width)
    }
    
    func printDetails () -> String {
        return "The area of the rectangle is \(area()) and the perimeter of the rectangle is \(perimeter())"
    }
}

class Circle: Shape {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    override func area () -> Double {
        return 3.14 * radius
    }
    
    override func perimeter() -> Double {
        return 2 * 3.14 * radius
    }
    
    func printDetails () -> String {
        return "The area of the circle is \(area()) and the perimeter of the circle is \(perimeter())"
    }
}

let rect = Rectangle(width: 2.2, height: 4.4)

print("Rectangle -- \(rect.printDetails())")

let cir = Circle(radius: 3)

print("Circle -- \(cir.printDetails())")


// Swift Protocols


protocol Vehicle {
    func drive()
}

struct Car : Vehicle {
    func drive () {
        print("Drive from car")
    }
}

struct Bike: Vehicle {
    func drive() {
        print("Drive from bike")
    }
}


protocol ShapeP {
    func nameOfShape() -> String
    func area() -> Double
    func perimeter() -> Double
    
}

class RectangleP: ShapeP {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
            self.width = width
            self.height = height
        }
    
    func area () -> Double {
        return height * width
    }
    
    func perimeter() -> Double {
        return 2 * (height + width)
    }
    
    func nameOfShape() -> String {
        return "Rectangle"
    }
}

class CircleP: ShapeP {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func area () -> Double {
        return 3.14 * radius
    }
    
    func perimeter() -> Double {
        return 2 * 3.14 * radius
    }
    
    func nameOfShape () -> String {
        return "Circle"
    }
}


// Swift Extensions

// 1
extension Int {
    func cube() -> Int {
        return self*self*self
    }
}

print("Cube of 5 is \(5.cube())")

// 2
extension String {
    func toInt() -> Int? {
        return Int(self)
    }
}
let stringValue = "1"
if let intValue = stringValue.toInt() {
    print("Int value of string is \(intValue)")
} else {
    print("String value of int cannot be evaluated")
}

//3

extension Array where Element: Comparable {
    func minMax() -> (min: Element, max: Element)? {
        guard let firstE = self.first else { return nil }
        var minVal = firstE
        var maxVal = firstE
        
        for element in self {
            if element < minVal {
                minVal = element
            } else if element > maxVal {
                maxVal = element
            }
        }
        
        return (minVal, maxVal)
    }
}

let numbers = [5, 3, 8, 2, 4, 1]
if let (min, max) = numbers.minMax() {
    print("Minimum value:", min)
    print("Maximum value:", max)
} else {
    print("Array is empty.")
}

// 4

extension Date {
    func formattedString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: self)
    }
}
let newDate = Date()
let currentDate = Date()
print("Formatted date:", currentDate.formattedString())

