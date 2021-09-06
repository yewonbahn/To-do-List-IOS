//
//  TodoDetailViewController.swift
//  Todolist
//
//  Created by 반예원 on 2021/09/01.
//

import UIKit
import CoreData

enum PriorityLevel: Int64 {
    case level1
    case level2
    case level3
}
extension PriorityLevel {
    var color: UIColor{
        switch self
        {
        case.level1:
            return .green
        case.level2:
            return .orange
        case.level3:
            return .red
        }
    }
}
protocol TodoDetailViewControllerDelegate:  AnyObject {
    func didFinishSaveData()
    
}

class TodoDetailViewController: UIViewController {
    weak var delegate : TodoDetailViewControllerDelegate?
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var lowButton: UIButton!
    var priority: PriorityLevel?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func setPriority(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            priority = .level1
        
        case 2:
            priority = .level2
           
        case 3:
            priority = .level3
   
            
        default:
            break
            
        }
    }
    

    @IBAction func saveTodo(_ sender: Any) {
 
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "TodoList", in: context) else{ return }
         
       guard let object = NSManagedObject(entity: entityDescription,
            insertInto: context) as? TodoList else{
        return
       }
  
        object.title = titleTextField.text
        object.date = Date()
        object.uuid = UUID()
        object.prioritylevel = priority?.rawValue ?? PriorityLevel.level1.rawValue
        print(titleTextField.text ?? "zz")
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContext()
        
        delegate?.didFinishSaveData()
        self.dismiss(animated: true)
        
        
        
    }
    
    @IBAction func deleteTodo(_ sender: Any) {
    }
}
