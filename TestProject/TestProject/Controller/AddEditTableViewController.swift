//
//  AddEditTableViewController.swift
//  TestProject
//
//  Created by Nikita Skripka on 17.12.2023.
//

import UIKit

class AddEditTableViewController: UITableViewController {

    //MARK: - @IBOutlets
    @IBOutlet weak var taskTextFieldOutlet: UITextField!
    @IBOutlet weak var taskDescribtionTextViewOutlet: UITextView!
    
    //MARK: - Properties
    var task: Task?
    weak var firstTableVCDelegate: AddEditTaskViewControllerDelegate?
    weak var taskInformationVCDelegate: AddEditTaskVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let task {
            taskTextFieldOutlet.text = task.task
            taskDescribtionTextViewOutlet.text = task.describtion
        }
        
        configureAddEditTaskVC()
    }
    
    private func configureAddEditTaskVC() {
        taskDescribtionTextViewOutlet.layer.borderWidth = 2
        taskDescribtionTextViewOutlet.layer.borderColor = UIColor.gray.cgColor
    }
    
    //MARK: - @IBActions
    
    @IBAction func saveTaskButtonAction(_ sender: UIBarButtonItem) {
        let selfTask = taskTextFieldOutlet.text ?? ""
        let descriptionTask = taskDescribtionTextViewOutlet.text ?? ""
        task = Task(task: selfTask, describtion: descriptionTask, isActive: true)
        firstTableVCDelegate?.addTask(FirstTableViewController(), with: task ?? Task(task: "", describtion: "", isActive: true))
        taskInformationVCDelegate?.updateUI(TaskInformationViewController(), with: task ?? Task(task: "", describtion: "", isActive: true))
        self.dismiss(animated: true)
    }
    
    @IBAction func cancelTaskButtonAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
