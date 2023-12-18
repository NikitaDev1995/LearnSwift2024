//
//  TaskInformationViewController.swift
//  TestProject
//
//  Created by Nikita Skripka on 17.12.2023.
//

import UIKit

protocol AddEditTaskVCDelegate: AnyObject {
    func updateUI(_ viewController: UIViewController, with task: Task)
}

class TaskInformationViewController: UIViewController, AddEditTaskVCDelegate {

    //MARK: - Outlets
    @IBOutlet weak var taskLabelOutlet: UILabel!
    @IBOutlet weak var describtionLabelOutlet: UILabel!
    
    //MARK: - properties
    var task: Task?
    weak var firstTableVCDelegate: TaskInformationViewControllerDelegate?
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        taskLabelOutlet.text = task?.task
        describtionLabelOutlet.text = task?.describtion
    }
    
    //MARK: - Methods
    func updateUI(_ viewController: UIViewController, with task: Task) {
        self.task = task
        taskLabelOutlet.text = task.task
        describtionLabelOutlet.text = task.describtion
    }
    
    //MARK: - @IBActions
    @IBAction func editTaskButtonAction(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addEditTaskVC = storyboard.instantiateViewController(withIdentifier: "AddEditTableViewController") as! AddEditTableViewController
        let navigationController = UINavigationController(rootViewController: addEditTaskVC)
        addEditTaskVC.taskInformationVCDelegate = self
        addEditTaskVC.task = task
        self.navigationController?.present(navigationController, animated: true)
    }

    
    @IBAction func backToFirstVCButtonAction(_ sender: UIBarButtonItem) {
        
        if let task {
            firstTableVCDelegate?.changeTask(FirstTableViewController(), with: task)
        } else {
            firstTableVCDelegate?.changeTask(FirstTableViewController(), with: task ?? Task(task: "", describtion: "", isActive: false))
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}
