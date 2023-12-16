//
//  TaskTableViewCell.swift
//  TestProject
//
//  Created by Nikita Skripka on 16.12.2023.
//

import UIKit

class TaskTableViewCell: UITableViewCell {


    @IBOutlet weak var taskLabelOutlet: UILabel!
    
    @IBOutlet weak var descriptionLabelOutlet: UILabel!
    
    @IBOutlet weak var isActiveSwitchOutlet: UISwitch!
}