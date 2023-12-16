//
//  FirstTableViewController.swift
//  TestProject
//
//  Created by Nikita Skripka on 16.12.2023.
//

import UIKit

class FirstTableViewController: UITableViewController {

    //MARK: - properties
    var tasks = [Task]()
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
     
        if tasks.isEmpty {
            tasks = Task.initialTasks()
        }
        
        let nibTaskCell = UINib(nibName: "TaskTableViewCell", bundle: nil)
        tableView.register(nibTaskCell, forCellReuseIdentifier: "TaskCell")
    }

}

//MARK: - TableViewDelegate and TableVIewDataSource
extension FirstTableViewController {
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "TaskInformationViewController") as! TaskInformationViewController
        
        let task = tasks[indexPath.row]
        vc.task = task
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
