//
//  ViewController.swift
//  Refeicao
//
//  Created by Diego Rattis on 03/01/18.
//  Copyright © 2018 Diego Rattis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnIngredientDelegate {

    @IBOutlet var nameField : UITextField?
    @IBOutlet var happinessField : UITextField?
    var delegate : AddAMealDelegate?
    var ingredientes = Array<Ingrediente>()
    var selected = Array<Ingrediente>()
    @IBOutlet var tableView: UITableView?
    
    override func viewDidLoad() {
        let newIngrediente = UIBarButtonItem(title: "New Ingredient", style: UIBarButtonItemStyle.plain, target: self, action: #selector(newItemNavigation))
        navigationItem.rightBarButtonItem = newIngrediente
        
        ingredientes = IngredientsDao().load()
    }
    
    func add(_ ingredient: Ingrediente) {
        ingredientes.append(ingredient)
        IngredientsDao().save(ingredientes)
        if let table = tableView {
            table.reloadData()
        }
        else{
            Alert(controller: self).show(message: "Unable to update the table")
        }
        
    }
    
    @objc func newItemNavigation(){
        let newIngredienteViewController = NewIngredienteViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newIngredienteViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        let ingrediente = ingredientes[indexPath.row]
        
        cell.textLabel!.text = ingrediente.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            let ingrediente = ingredientes[indexPath.row]
            if(cell.accessoryType == UITableViewCellAccessoryType.none){
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
                selected.append(ingrediente)
            }
            else{
                cell.accessoryType = UITableViewCellAccessoryType.none
                if let indiceIngrediente = selected.index(of: ingrediente){
                    selected.remove(at:indiceIngrediente)
                }
                
            }
        }
        else{
            Alert(controller: self).show()
        }
    }
    
    func convertToInt(_ text:String?) -> Int?{
        if let textNumber = text{
            return Int(textNumber)
        }
        return nil
    }
    
    func getMealFromForm() -> Meal?{
        if let name = nameField?.text {
            if let happiness = convertToInt(happinessField?.text){
                let meal = Meal(name: name, happiness: happiness, ingredientes: selected)
                
                print("eaten \(meal.name) with happiness \(meal.happiness) with \(meal.ingredientes.count) ingredients.")
                
                return	meal
            }
        }
        return nil
    }
    
    @IBAction func Add(){
        
        if let meal = getMealFromForm(){
            if let meals = delegate{
                meals.add(meal)
                if let navigation = navigationController {
                    navigation.popViewController(animated: true)
                }
                else{
                    Alert(controller: self).show(message: "Unable to go back, but the meal was added.")
                }
                return
            }
        }
        Alert(controller: self).show(message: "Unable to add meal.")
    }

}

