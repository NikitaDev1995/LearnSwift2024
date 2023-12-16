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
    
}
