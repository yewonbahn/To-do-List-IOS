//
//  ViewController.swift
//  Todolist
//
//  Created by 반예원 on 2021/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TO DO LIST"
        
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
        item.tintColor = .black
        
        navigationItem.rightBarButtonItem = item
    }

    @objc func addNewTodo()
    {
        
        
    }
}
