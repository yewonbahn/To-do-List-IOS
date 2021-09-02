//
//  TodoDetailViewController.swift
//  Todolist
//
//  Created by 반예원 on 2021/09/01.
//

import UIKit
import CoreData

class TodoDetailViewController: UIViewController {
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var lowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func setPriority(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            break
        case 2:
            break
        case 3:
            break
            
        default:
            break
            
        }
    }
    

    @IBAction func saveTodo(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Todolist", in: context) else{return}
        
       guard let object = NSManagedObject(entity: entityDescription, insertInto: context) as? TodoList else{return}
        
        
        
        
    }
    
    @IBAction func deleteTodo(_ sender: Any) {
    }
}
