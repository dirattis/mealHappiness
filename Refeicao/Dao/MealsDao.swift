import Foundation

class MealsDao {

    let mealsDirectory:String
    init() {
        
        let dirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = dirs[0]
        let archive = "\(dir)/meals.dados"
        mealsDirectory = archive
        print(archive)
    }
    
    func save(_ meals:Array<Meal>){
        NSKeyedArchiver.archiveRootObject(meals, toFile: mealsDirectory)
    }
    
    func load() -> Array<Meal>{
        if let meals = NSKeyedUnarchiver.unarchiveObject(withFile: mealsDirectory){
                return meals as! Array<Meal>
        }
        
        return []
    }
}
