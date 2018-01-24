//
//  NewIngredienteViewController.swift
//  Refeicao
//
//  Created by Diego Rattis on 15/01/18.
//  Copyright © 2018 Diego Rattis. All rights reserved.
//

import UIKit

class NewIngredienteViewController: UIViewController {

    @IBOutlet var nameField: UITextField?
    @IBOutlet var caloriesField: UITextField?
    var delegate: AddAnIngredientDelegate?
    
    init(delegate: AddAnIngredientDelegate){
        super.init(nibName: "NewIngredienteViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    @IBAction func add(){
        
        let name = nameField!.text
        let calories = Double(caloriesField!.text!)
        if(name == nil || calories  == nil || delegate == nil)
        {
            return
        }
        
        let ingrediente = Ingrediente(name: name!, calories: calories!)
            
         delegate!.add(ingrediente)
            
        if let navigation = navigationController{
            navigation.popViewController(animated: true)
        }
        
    }

}
