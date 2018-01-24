
import Foundation

class IngredientsDao {
    
    let ingredientsDirectory:String
    init() {
        
        let dirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = dirs[0]
        let archive = "\(dir)/ingredients.dados"
        ingredientsDirectory = archive
        print(archive)
    }
    
    func save(_ ingredients:Array<Ingrediente>){
        NSKeyedArchiver.archiveRootObject(ingredients, toFile: ingredientsDirectory)
    }
    
    func load() -> Array<Ingrediente>{
        if let ingredients = NSKeyedUnarchiver.unarchiveObject(withFile: ingredientsDirectory){
            return ingredients as! Array<Ingrediente>
        }
        
        return []
    }
}
