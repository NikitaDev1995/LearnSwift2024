//
//  TaskTableViewCell.swift
//  TestProject
//
//  Created by Nikita Skripka on 16.12.2023.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    //MARK: - @IBOutlets
    @IBOutlet weak var taskLabelOutlet: UILabel!
    @IBOutlet weak var descriptionLabelOutlet: UILabel!
    @IBOutlet weak var isActiveSwitchOutlet: UISwitch!
    
    
    @IBAction func isActiveSwitchAction(_ sender: UISwitch) {
        
    }
    
}
