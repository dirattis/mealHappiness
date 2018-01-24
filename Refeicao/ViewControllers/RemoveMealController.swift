//
//  RemoveMealController.swift
//  Refeicao
//
//  Created by Diego Rattis on 17/01/18.
//  Copyright © 2018 Diego Rattis. All rights reserved.
//

import UIKit

class RemoveMealController {
    let controller:UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func show(_ meal:Meal, handler: @escaping (UIAlertAction) -> Void){
        
        let details = UIAlertController(title: meal.name, message: meal.showDetails(), preferredStyle: UIAlertControllerStyle.alert)
        
        let btnCancel = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
        
        let btnRemover = UIAlertAction(title: "Remover", style: UIAlertActionStyle.destructive, handler: handler)
        
        details.addAction(btnCancel)
        details.addAction(btnRemover)
        
        controller.present(details, animated: true, completion: nil)
    }
}
