//
//  TaskTableViewCell.swift
//  TestProject
//
//  Created by Nikita Skripka on 16.12.2023.
//

import UIKit

protocol TaskTableViewCellDelegate: AnyObject {
    func didChangeActivity(_ cell: TaskTableViewCell, isActive: Bool)
}

class TaskTableViewCell: UITableViewCell {
    //MARK: - @IBOutlets
    @IBOutlet weak var taskLabelOutlet: UILabel!
    @IBOutlet weak var descriptionLabelOutlet: UILabel!
    @IBOutlet weak var isActiveSwitchOutlet: UISwitch!
    
    //MARK: - Properties
    weak var delegate: TaskTableViewCellDelegate?
    
    //MARK: - Methods
    func configureCell(_ task: Task) {
        taskLabelOutlet.text = task.task
        descriptionLabelOutlet.text = task.describtion
        isActiveSwitchOutlet.isOn = task.isActive
    }
    
    //MARK: - @IBActions
    @IBAction func isActiveSwitchAction(_ sender: UISwitch) {
        delegate?.didChangeActivity(self, isActive: sender.isOn)
    }
    
}
