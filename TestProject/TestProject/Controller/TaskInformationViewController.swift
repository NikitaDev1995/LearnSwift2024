//
//  TaskInformationViewController.swift
//  TestProject
//
//  Created by Nikita Skripka on 17.12.2023.
//

import UIKit

class TaskInformationViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var taskLabelOutlet: UILabel!
    
    
    @IBOutlet weak var describtionLabelOutlet: UILabel!
    
    //MARK: - properties
    var task: Task?
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        taskLabelOutlet.text = task?.task
        describtionLabelOutlet.text = task?.describtion
    }
    
    //MARK: - @IBActions
    
    @IBAction func editTaskButtonAction(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddEditTableViewController") as! AddEditTableViewController
        let navigationController = UINavigationController(rootViewController: vc)
        vc.task = task
        self.navigationController?.present(navigationController, animated: true)
    }
    
}
