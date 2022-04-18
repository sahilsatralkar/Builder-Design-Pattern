import UIKit

///Builder design pattern

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

//Enums
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
                var toppingsCount = toppings.count
            for topping in toppings {
                toppingString.append(topping.rawValue)
                toppingsCount -= 1
                if toppingsCount != 0 {
                    toppingString.append(", ")
                }
            }
                return "Your \(size.rawValue) size, \(base.rawValue) Pizza with toppings: \(toppingString) is ready. Enjoy!"
        }
        print(result)
        return pizza
    }
    
    func setPredefinedPizza (newPizza : Pizza) {
        self.base = newPizza.base
        self.size = newPizza.size
        self.toppings = newPizza.toppings
    }
}


//Director
class PizzaDirector {
    let pizzaBuilder = PizzaBuilder()
    
    static let customPizza = Pizza(base: .classic, size: .medium, toppings: [])
    static let farmhousePizza = Pizza(base: .classic, size: .medium, toppings: [.cheese,.capsicum,.onion,.tomato])
    static let margheritaPizza = Pizza(base: .classic, size: .medium, toppings: [.cheese])
    static let pepperoniPizza = Pizza(base: .classic, size: .medium, toppings: [.cheese,.pepperoni])
    static let meatLoversPizza = Pizza(base: .classic, size: .medium, toppings: [.cheese,.herbedChicken,.pepperoni])
    
}

//Client
var newPizzaOrder = PizzaDirector()
newPizzaOrder.pizzabuilder.setPredefinedPizza(newPizza: PizzaDirector.farmhousePizza)
newPizzaOrder.pizzabuilder.addToppings(newToppings: [.herbedChicken])
newPizzaOrder.pizzabuilder.addToppings(newToppings: [.mushroom])
newPizzaOrder.pizzabuilder.removeTopping(topping: .tomato)
newPizzaOrder.pizzabuilder.removeTopping(topping: .onion)
newPizzaOrder.pizzabuilder.changeBase(newBase: .deepDish)
newPizzaOrder.pizzabuilder.changeSize(newSize: .large)
newPizzaOrder.pizzabuilder.build()
