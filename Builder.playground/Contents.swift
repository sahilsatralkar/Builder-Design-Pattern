import UIKit
import Foundation

///Builder pattern
///

// Product
class Pizza {
    
    let base : Base
    let size : Size
    let toppings : [Topping]
    
    init (base : Base, size: Size, toppings: [Topping]) {
        self.base = base
        self.size = size
        self.toppings = toppings
        
    }
    
}

enum Base : String {
    case classic = "Classic"
    case thinCrust = "Thin crust"
    case deepDish = "Deep dish"
    
}
enum Size : String {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}
enum Topping : String {
    case cheese = "Cheese"
    case onion = "Onion"
    case tomato = "Tomato"
    case capsicum = "Capsicum"
    case mushroom = "Mushroom"
    case herbedChicken = "Herbed chicken"
    case pepperoni = "Pepperoni"
}


// Builder
class PizzaBuilder {
    private var base : Base = .classic
    private var size : Size = .medium
    private var toppings : [Topping] = [.cheese]
    
    func addToppings( newToppings : [Topping]) {
        toppings.insert(contentsOf: newToppings, at: 0)
    }
    func removeTopping(topping : Topping) {

        if let index = self.toppings.firstIndex(of: topping) {
            self.toppings.remove(at: index)
        }
    }

    func changeSize (newSize : Size){
        self.size = newSize
    }
    func changeBase (newBase : Base){
        self.base = newBase
    }
    
    func build() -> Pizza {
         let pizza = Pizza(base: base, size: size, toppings: toppings)
        
            var result : String {
            var toppingString : String = ""
            for topping in toppings {
                toppingString.append(topping.rawValue)
                toppingString.append(", ")
            }
            //let printable = toppingString.joined(separator: ", ")
            return toppingString
        }
        print(result)
        return pizza
    }
    
    func setPredefinedPizza (newPizza : Pizza) {
        self.base = newPizza.base
        self.size = newPizza.size
        self.toppings = newPizza.toppings
    }
    let farmhousePizza = Pizza(base: .classic, size: .small, toppings: [.cheese,.capsicum,.onion,.tomato])
}


//Director
class PizzaDirector {
    var pizzabuilder = PizzaBuilder()
    
    static let customPizza = Pizza(base: .classic, size: .medium, toppings: [])
    static let farmhousePizza = Pizza(base: .classic, size: .medium, toppings: [.cheese,.capsicum,.onion,.tomato])
    static let margheritaPizza = Pizza(base: .classic, size: .medium, toppings: [.cheese])
    static let pepperoniPizza = Pizza(base: .classic, size: .medium, toppings: [.cheese,.pepperoni])
    static let meatLoversPizza = Pizza(base: .classic, size: .medium, toppings: [.cheese,.herbedChicken,.pepperoni])
    
}

//Client
var newPizzaOrder = PizzaDirector()
newPizzaOrder.pizzabuilder.setPredefinedPizza(newPizza: PizzaDirector.farmhousePizza)
newPizzaOrder.pizzabuilder.addToppings(newToppings: [.mushroom])
newPizzaOrder.pizzabuilder.removeTopping(topping: .tomato)
newPizzaOrder.pizzabuilder.changeBase(newBase: .deepDish)
newPizzaOrder.pizzabuilder.changeSize(newSize: .large)
newPizzaOrder.pizzabuilder.build()
