//
//  main.swift
//  Swift_Basics
//
//  Created by M_2022814 on 12/9/21.
//

import Foundation

print("Hello, World!")

// MARK: - Variables and Constants
// the let keyword creates a constant that stays the same and can't be changed
let myConstant = "Dragon's Breadth"
print("A constant using the let keyword is being printed: \(myConstant)")

// the var keyword creates a variable that serves as a reference to a specific point in memory that can be changed
var myVariable = "Midnight Moonlight"
print("A variable using the var keyword is being printed: \(myVariable)")
myVariable = "Sorrow and Pain"
print("The previously created variable has been changed and is being reprinted with the updated value: \(myVariable)")

// MARK: - Data Types

// Swift is a type-safe language meaning that the compiler requires you to specify the data type in order to prevent you from passing... say for example a string data type into a math equation that requires a number

// Integers: Numbers without a fractional component
var integer: Int = 33
// Doubles: Numbers with a fractional component that can be up to 64-bits long
var double: Double = 33.000
// Float: Numbers with a fractional component that can be up to 32-bits long. Less precise then a double, but requires half the memory.
var floatingPoint: Float = 33.000

// Booleans: Can be true or false
let booleanValue = true
let booleanValue2 = false

// Tuples: group multiple values into a single compound value. The uniqueness of a tuple is that these multiple values can be of any data type and don't have to be the same type as eachother
var candyAss = ["lovesick", "softness", "momentary dream"]
let tupleExample = (23, 15.000, "Sorrow and Death", true, candyAss)
print("Print statement of a tuple: \(tupleExample)")

//Access individual Elements of a tuple by using the index number
print("""
    Individual Elements selected in a tuple:
        First Item in the tuple: \(tupleExample.0)
        Second Item in the tuple: \(tupleExample.1)
        Third Item in the tuple: \(tupleExample.2)
        Fourth Item in the tuple: \(tupleExample.3)
        Fifth Item in the tuple: \(tupleExample.4)
    """)

// MARK: - Optionals
// Optionals: Data types that are used where a value may be absent. Either there is a value and you can unwrap the optional to access that value, or there isn't a value at all
let possibleNumber = "1234"
let convertedNumber = Int(possibleNumber)
print("""
    This is an example of an optional that has not been unwrapped: \(convertedNumber)
    This is the same example of that unwrapped optionsl \(convertedNumber!)
    """)

// nil: An optional value can be set to a valueless state called nil:
var serverResponseCode: Int? = 404
print("Server Response Code that HAS NOT been set to nil: \(serverResponseCode)")
serverResponseCode = nil
print("Server Response Code that HAS been set to nil: \(serverResponseCode)")

// You can use a conditional statement to make sure an optional value is not nil. If you unwrap an optional and it contains a nil, the program will crash. This is a form of error handling
if serverResponseCode != nil {
    print("Server Response Code \(serverResponseCode!)")
} else {
    print("Server Response Code is Nil")
}

// Optional Binding: Used to find out whether an optional contains a value, and if so, make that value available as a temporary constant or variable.
var chicken = "1234"
var steak = "abcdedggg"
if let actualNumber = Int(chicken) {
    print(" The string \(chicken) has an integer value of \(actualNumber)")
} else {
    print("The value couldn't be converted to an integer")
}
if let actualNumber = Int(steak) {
    print(" The string \(steak) has an integer value of \(actualNumber)")
} else {
    print("The value couldn't be converted to an integer")
}

// Optional Binding can be chained:

if let firstNum = Int("1234"), let secondNum = Int("56"), secondNum < firstNum && firstNum > 500 {
    print("All that stuff in the conditional statement was true")
} else {
    print("Some condition was not met")
}

// MARK: - Error Handling

// You use error handling to respond to any error conditions that you may encounter during execution

func canThrowError() throws {
    // this function may or may not throw an error
}

// The throws keyword used in the function above indicates that a function can throw an error
// When you call a function that can possibly throw an error, use the following format:

do {
    try canThrowError()
    // No error was thrown
} catch {
    // An error was thrown
    print("An error was thrown in the function")
}

// An example of how error handling works to respond to different conditions:

    // The sandwich Program:

        // Requirements for making a Sandwich
        var cleanDishesPresent = true
        var allIngredientsPresent = true

        // Errors possible when making a sandwich
        enum sandwichError: Error {
            //Enumeration definitions go here:
            case outOfCleanDishes
            case missingIngredients
        }

        do {
            try makeASandwich()
            eatASandwich()
        } catch sandwichError.outOfCleanDishes {
            washDishes()
            try makeASandwich()
        } catch sandwichError.missingIngredients{
            buyGroceries()
            try makeASandwich()
        }

        func makeASandwich() throws {
            
            guard cleanDishesPresent else {throw sandwichError.outOfCleanDishes}
            guard allIngredientsPresent else {throw sandwichError.missingIngredients}
            print("Sandwich has been successfully Made")
            
        }

        func eatASandwich() {
            print("My fatass is eating a sandwich")
        }
        
    func washDishes() {
        cleanDishesPresent = true
        print("Dishes are Washed")
    }
    
    func buyGroceries() {
        allIngredientsPresent = true
        print("Required Ingredients Purchased")
    }




