//
//  Task.swift
//  TestProject
//
//  Created by Nikita Skripka on 17.12.2023.
//

import Foundation

struct Task: Comparable {
    
    var task: String
    var describtion: String
    var isActive: Bool
    
    static func initialTasks() -> [Task] {
        let tasks = [Task(task: "Покормить кота", describtion: "Если кот получит еду он будет доволен =)", isActive: true),
        Task(task: "Поставить будильник на работу", describtion: "Будильник служит для того чтобы не проспать на работу", isActive: true),
        Task(task: "Сходить вечером выпить в баре", describtion: "Лучше буду сидеть программировать", isActive: false)]
        return tasks
    }
    
    static func < (lhs: Task, rhs: Task) -> Bool {
        return lhs.task > rhs.task
    }
}
