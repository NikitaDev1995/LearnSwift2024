//
//  FirstTableViewController.swift
//  TestProject
//
//  Created by Nikita Skripka on 16.12.2023.
//

import UIKit

class FirstTableViewController: UITableViewController {

    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        if tasks.isEmpty {
            tasks = Task.initialTasks()
        }
        
        let nibTaskCell = UINib(nibName: "TaskTableViewCell", bundle: nil)
        tableView.register(nibTaskCell, forCellReuseIdentifier: "TaskCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        
        let task = tasks[indexPath.row]
        cell.taskLabelOutlet.text = "\(task.task)"
        cell.descriptionLabelOutlet.text = "\(task.describtion)"
        cell.isActiveSwitchOutlet.isOn = task.isActive
        
        return cell
    }
    

}

