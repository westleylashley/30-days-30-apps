//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by Westley Lashley on 5/30/18.
//  Copyright © 2018 Westley Lashley. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()


    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addTapped(_ sender: UIButton) {
/*
        let toDo = ToDo()
        
        toDo.name = titleTextField.text!
        toDo.important = importantSwitch.isOn
        
        previousVC.toDos.append(toDo)
        previousVC.tableView.reloadData()
        
        navigationController?.popViewController(animated: true)
    }
 */
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        
            let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
    
            if let titleText = titleTextField.text {
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }
            
            try? context.save()
            
            navigationController?.popViewController(animated: true)
        }
    }
}
