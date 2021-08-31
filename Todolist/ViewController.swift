//
//  ViewController.swift
//  Todolist
//
//  Created by 반예원 on 2021/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TO DO LIST"
        self.makeNavigationBar()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
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
        
        
    }
}
extension ViewController : UITableViewDelegate, UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
    
    return cell;
}

}


