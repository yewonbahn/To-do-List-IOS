//
//  ViewController.swift
//  Todolist
//
//  Created by 반예원 on 2021/08/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    var todoList = [TodoList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TO DO LIST"
        self.makeNavigationBar()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        fetchData()
        todoTableView.reloadData()
        //data 가져오면 보통 reload함.
        
    }
    //core data 로써 local database에서 가져와야함.
    func fetchData(){
        let fetchRequest : NSFetchRequest<TodoList> = TodoList.fetchRequest()
        let context = appdelegate.persistentContainer.viewContext
        do{
            self.todoList = try context.fetch(fetchRequest)
        }
        catch{
            print(error)
        }
     
        
    }
    func makeNavigationBar(){
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
        item.tintColor = .black
        
        navigationItem.rightBarButtonItem = item
        
        let barApperance = UINavigationBarAppearance()
        
        barApperance.backgroundColor = UIColor(red: 50/255, green: 70/255, blue: 30/255, alpha: 0.3)
        
        self.navigationController?.navigationBar.standardAppearance = barApperance
        
    }

    @objc func addNewTodo()
    {
        let detailVC = TodoDetailViewController.init(nibName: "TodoDetailViewController", bundle: nil)
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
        
    }
}
extension ViewController : UITableViewDelegate, UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.todoList.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
    cell.topTitleLabel.text = todoList[indexPath.row].title
    if let hasData = todoList[indexPath.row].date{
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd hh:mm:ss"
        let dateString = formatter.string(from: hasData)
        cell.dateLabel.text = dateString
    }else{
        cell.dateLabel.text = ""
    }
    let priority = todoList[indexPath.row].prioritylevel
    
    let priorityColor = PriorityLevel(rawValue: priority)?.color
    cell.priorityView.backgroundColor = priorityColor

   
    return cell;
}

}


extension ViewController: TodoDetailViewControllerDelegate{
    func didFinishSaveData() {
        self.fetchData()
        self.todoTableView.reloadData()
    }
    
    
}
