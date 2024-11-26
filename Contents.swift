import Foundation

// structs are immutable and copy with value type, cannot inherit from each others (no subclasses)
// just taken (inherit with) protocols

struct Person {
    
    let name: String
    let age: Int
}

let foo = Person(name: "Foo", age: 20)
foo.name
foo.age

// ********************************************************************
/*
 struct CommodoreComputer {
    let name: String
    let manufacturer: String
 }
 
 let c64 = CommodoreComputer(
    name: "My commodore",
    manufacturer: "Commodore"
 )
 
 let c128 = CommodoreComputer(
    name: "My commodore 128",
    manufacturer: "Commodore"
 )
 */

struct CommodoreComputer {
    let name: String
    let manufacturer: String
    init(name: String) {
        self.name = name
        self.manufacturer = "Commodore"
    }
}

/* üstteki ile aynı işlemi yapar
 
 struct CommodoreComputer {
    let name: String
    let manufacturer = "Commodore"
}
*/

let c64 = CommodoreComputer(name: "c64")
c64.name
c64.manufacturer

let c128 = CommodoreComputer(name: "c128")
c128.name
c128.manufacturer


// ********************************************************************************


/* struct Person2 {
    
    let firstName: String
    let lastName: String
    let fullName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = "\(firstName) \(lastName)"
    }
}
*/

// üstteki kodun daha kısası
struct Person2 {
    let firstName: String
    let lastName: String
    var fullName: String { // computed property
        "\(firstName) \(lastName)"
    }
}

let fooBar = Person2(firstName: "Foo", lastName: "Bar")
fooBar.firstName
fooBar.lastName
fooBar.fullName
    
 // *********************************************************

struct Car {
    
    var currentSpeed: Int
    mutating func drive(speed: Int) {
        "Driving..."
        currentSpeed = speed
    }
}

let immutableCar = Car(currentSpeed: 10)
// immutableCar = Car(currentSpeed: 10) Cannot assign to value: 'immutableCar' is a 'let' constant
// immutableCar.drive(speed: 20) Cannot use mutating member on immutable value: 'immutableCar' is a 'let' constant

var mutableCar = Car(currentSpeed: 10)
let copy = mutableCar
mutableCar.currentSpeed
mutableCar.drive(speed: 30)
mutableCar.currentSpeed
copy.currentSpeed

// ************************************************************

/*
 struct Bike {
    let manufacturer: String
    var currentSpeed: Int
}

let bike1 = Bike(
    manufacturer: "BMW",
    currentSpeed: 10
)

var bike2 = bike1
bike2.currentSpeed = 30
 
*/

// yada daha çok tercih edileni

struct Bike {
    let manufacturer:String
    let currentSpeed:Int
    
    func copy(currentSpeed: Int) -> Bike {
        Bike(manufacturer: self.manufacturer, currentSpeed: currentSpeed)
    }
}

let bike1 = Bike(
    manufacturer: "HD",
    currentSpeed: 20
)

let bike2 = bike1.copy(currentSpeed: 30)
bike1.currentSpeed
bike2.currentSpeed


