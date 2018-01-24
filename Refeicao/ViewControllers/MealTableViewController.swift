
import UIKit

class MealTableViewController: UITableViewController, AddAMealDelegate {
    
    var meals = Array<Meal>()
    
    override func viewDidLoad() {
        meals = MealsDao().load()
    }
    
    func add(_ meal:Meal){
        meals.append(meal)
        MealsDao().save(meals)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addMeal"){
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = meals[indexPath.row]
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDetails))
        cell.addGestureRecognizer(longPress)
        cell.textLabel!.text = meal.name
        return cell
    }
    
    @objc func showDetails(recognizer: UILongPressGestureRecognizer){
        if(recognizer.state == UIGestureRecognizerState.began){
            let cell = recognizer.view as! UITableViewCell
            
            if let indexPath = tableView.indexPath(for: cell) {
                let row = indexPath.row
                let meal = meals[row]
                
                RemoveMealController(controller: self).show(meal, handler: {
                    alert in
                    self.meals.remove(at: row)
                    self.tableView.reloadData()
                })
            }
        }
    }
}
