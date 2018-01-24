import Foundation

class Meal :NSObject, NSCoding{
    
    
    
    let name:String
    let happiness:Int
    let ingredientes:Array<Ingrediente>
    
    init(name:String, happiness:Int, ingredientes:Array<Ingrediente> = []) {
        self.name = name
        self.happiness = happiness
        self.ingredientes = ingredientes
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(happiness, forKey: "happiness")
        aCoder.encode(ingredientes, forKey: "ingredientes")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        happiness = aDecoder.decodeInteger(forKey: "happiness")
        ingredientes = aDecoder.decodeObject(forKey: "ingredientes") as! Array
    }
    
    func allCalories() -> Double{
        var total = 0.0
        
        for ingrediente in ingredientes{
            total += ingrediente.calories
        }
        
        return total
    }
    
    func showDetails() -> String{
        var details = "Happiness \(happiness) with the following ingredients: \n"
        for ingredient in ingredientes {
            details += "\(ingredient.name) - \(ingredient.calories) calories. \n"
        }
        details += "Total: \(allCalories()) calories."
        return details
    }
    
    
}
