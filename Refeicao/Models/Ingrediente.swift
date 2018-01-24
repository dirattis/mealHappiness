import Foundation

class Ingrediente : NSObject, NSCoding{
    
    var name:String
    var calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(calories, forKey: "calories")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        calories = aDecoder.decodeDouble(forKey: "calories")
    }
    
}

func ==(first:Ingrediente, second:Ingrediente) -> Bool{
    
    return first.name == second.name && first.calories == second.calories
}
