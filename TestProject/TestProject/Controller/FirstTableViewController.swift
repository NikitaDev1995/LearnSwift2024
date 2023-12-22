//
//  FirstTableViewController.swift
//  TestProject
//
//  Created by Nikita Skripka on 16.12.2023.
//

import UIKit

protocol AddEditTaskViewControllerDelegate: AnyObject {
    func addTask(_ viewController: FirstTableViewController, with task: Task)
}

protocol TaskInformationViewControllerDelegate: AnyObject {
    func changeTask(_ viewController: FirstTableViewController, with task: Task)
}

class FirstTableViewController: UITableViewController {

    //MARK: - properties
    var tasks = [Task]() {
        didSet {
            tasks.sort(by: >)
            Task.saveTask(tasks)
        }
    }
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
     
        if tasks.isEmpty {
            tasks = Task.loadTask()
        }
        
        let nibTaskCell = UINib(nibName: "TaskTableViewCell", bundle: nil)
        tableView.register(nibTaskCell, forCellReuseIdentifier: "TaskCell")
    }
    
    //MARK: - @IBActions
    @IBAction func AddTaskButtonAction(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addEditTaskVC = storyboard.instantiateViewController(identifier: "AddEditTableViewController") as! AddEditTableViewController
        let navigationController = UINavigationController(rootViewController: addEditTaskVC)
        addEditTaskVC.firstTableVCDelegate = self
        
        self.navigationController?.present(navigationController, animated: true)
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
        cell.configureCell(task)
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let taskInformationVC = storyboard.instantiateViewController(identifier: "TaskInformationViewController") as! TaskInformationViewController
        taskInformationVC.firstTableVCDelegate = self
        
        let task = tasks[indexPath.row]
        taskInformationVC.task = task
        
        tasks.remove(at: indexPath.row)
        self.navigationController?.pushViewController(taskInformationVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            tableView.beginUpdates()
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}

extension FirstTableViewController: AddEditTaskViewControllerDelegate, TaskInformationViewControllerDelegate, TaskTableViewCellDelegate {
    
    //MARK: - Methods
    func addTask(_ viewController: FirstTableViewController, with task: Task) {
        tasks.append(task)
        tableView.reloadData()
    }

    func changeTask(_ viewController: FirstTableViewController, with task: Task) {
        tasks.append(task)
        tableView.reloadData()
    }
    
    func didChangeActivity(_ cell: TaskTableViewCell, isActive: Bool) {
        if let indexPath = tableView.indexPath(for: cell) {
            tasks[indexPath.row].isActive = isActive
        }
    }
}
