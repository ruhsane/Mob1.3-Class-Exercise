import UIKit

func add(number1: Int, number2: Int) -> Int {
    return number1 + number2
}

add(number1: 2,number2: 5)

//{ (parameters) -> return type in
//    statements
//}
//
//{(number1: Int, number2: Int) -> Int in
//    return number1 + number2
//}

let closure: (Int, Int) -> Int = { (number1, number2) in
    return number1 + number2
}
closure(2, 5)


//sort names based on alphabet, but reversed.
//function approach
let names = ["Andrea", "Chris", "Marie", "Beth", "Tom"]

func reverseAlphabetical(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: reverseAlphabetical)

print(reversedNames)

//closure approach
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

/*: Exercise 1
Write a closure that prints the string "Learning Swift" and assign the closure to a variable. Then call the closure.
*/
let string = {
    print("Learning Swift")
}
string()

/*:
Exercise 2
Write a closure that takes two integers and returns the sum of the integers. Assign the closure to a variable and then call the closure. The closure can be written in a few different ways. Experiment and try 2 ways.
*/
let sum: (Int, Int) -> Int = { (n1, n2) in
    return n1+n2
}
sum(2, 5)

let summ: (Int, Int) -> Int = { return $0 + $1 }
summ(4,5)
/*:
Exercise 3
Write a closure that returns the value 42, without assigning the closure to a variable. Immediately call the closure and also ignore the return value from the closure.
*/
func return42(closure: () -> ()) {
    closure()
}

return42(closure: {
    return 42
})

/*:
Exercise 4
Sort the array:

let numbers = [22, 10, 42, 100, 8, 4]
Use a closure and the sorted(by:) method.
*/

let numbers = [22, 10, 42, 100, 8, 4]
let sort = numbers.sorted(by: { (n1: Int, n2: Int) -> Bool in
    n1<n2
})

/*:
Exercise 5
Write a function that returns a closure. The function should contain the following variable:

let message = "This is an important message"
The closure that the function returns should print the value of that variable.
*/

func haha(str: String) -> () {
    print(str)
}

let message = "This is an important message"
haha(str: message)


// first way
func flyAway(finalStage: String){
    print("\(finalStage) emerged, flying away... ")
}

func metamorphosis(initialStage:String, completion: (String) -> Void){
    print("Caterpillar creates cocoon.")
    // They stay inside for up to 21 days.
    for _ in 1...5 {
        sleep(1)
        print("\(initialStage) inside cocoon")
    }
    completion("🦋")
}

metamorphosis(initialStage:"🐛", completion: flyAway)



//second way with trailing closure
func flyAway(finalStage: String){
    print("\(finalStage) emerged, flying away... ")
}

func metamorphosis(initialStage:String, completion: (String) -> Void){
    print("Caterpillar creates cocoon.")
    // They stay inside for up to 21 days.
    for _ in 1...5 {
        sleep(1)
        print("\(initialStage) inside cocoon")
    }
    completion("🦋")
}

metamorphosis(initialStage: "🐛") { butterfly in
    print("\(butterfly) emerged, flying away... ")
}


//third way with escaping closure
var variableClosure : (String) -> Void = {_ in return }

func metamorphosis(initialStage:String, completion: @escaping (String) -> Void){
    print("Caterpillar creates cocoon.")
    
    // They stay inside for up to 5 days.
    for _ in 1...5 {
//        sleep(1)
        print("\(initialStage) inside cocoon")
    }
    variableClosure = completion
}


metamorphosis(initialStage: "🐛") { butterfly in
    print("\(butterfly) emerged, flying away... from function call")
}

variableClosure("🦋")


