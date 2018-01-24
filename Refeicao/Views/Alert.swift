
import UIKit

class Alert{

    let controller: UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(_ title:String = "Sorry", message:String = "Unexpected error"){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let btnOk = UIAlertAction(title: "Understood", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(btnOk)
        
        controller.present(alert, animated: true, completion: nil)
    }
}
