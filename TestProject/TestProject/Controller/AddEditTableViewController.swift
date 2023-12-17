//
//  AddEditTableViewController.swift
//  TestProject
//
//  Created by Nikita Skripka on 17.12.2023.
//

import UIKit

class AddEditTableViewController: UITableViewController {

    //MARK: - @IBOutlets
    @IBOutlet weak var taskTestFieldOutlet: UITextField!
    @IBOutlet weak var taskDescribtionTextViewOutlet: UITextView!
    
    //MARK: - Properties
    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let task {
            taskTestFieldOutlet.text = task.task
            taskDescribtionTextViewOutlet.text = task.describtion
        }
    }

   
}
