//
//  CompleteToDoViewController.swift
//  ToDoList
//
//  Created by Westley Lashley on 5/30/18.
//  Copyright © 2018 Westley Lashley. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCoreData?

    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = selectedToDo?.name
    }

    @IBAction func completeTapped(_ sender: UIButton) {
       
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let theToDo = selectedToDo {
                context.delete(theToDo)
                navigationController?.popViewController(animated: true)
            }
        }
        /*
        var index = 0
        for toDo in previousVC.toDos {
            if toDo.name == selectedToDo.name {
                previousVC.toDos.remove(at: index)
                previousVC.tableView.reloadData()
                navigationController?.popViewController(animated: true)
                break
            }
            index += 1
        }
        
    }
 */
    }
}
