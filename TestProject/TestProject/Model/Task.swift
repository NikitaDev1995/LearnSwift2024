//
//  Task.swift
//  TestProject
//
//  Created by Nikita Skripka on 17.12.2023.
//

import Foundation

struct Task: Comparable, Codable {
    
    enum TaskKey: String {
        case keyForTask = "TaskKey"
    }
    
    var task: String
    var describtion: String
    var isActive: Bool
    
    static func saveTask(_ tasks: [Task]) {
        let data = try? JSONEncoder().encode(tasks)
        UserDefaults.standard.set(data, forKey: TaskKey.keyForTask.rawValue)
    }
    
    static func loadTask() -> [Task] {
        if let data = UserDefaults.standard.data(forKey: TaskKey.keyForTask.rawValue),
           let tasks = try? JSONDecoder().decode([Task].self, from: data) {
            return tasks
        } else {
            return []
        }
    }
    
    static func < (lhs: Task, rhs: Task) -> Bool {
        return lhs.task > rhs.task
    }
}
