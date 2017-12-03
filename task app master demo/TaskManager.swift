//
//  TaskManager.swift
//  task app master demo
//
//  Created by Dilraj Devgun on 12/2/17.
//  Copyright © 2017 Dilraj Devgun. All rights reserved.
//

import Foundation

class TaskManager {
    private var tasks:[Task]!
    
    init() {
        self.tasks = []
    }
    
    func addTaskWithName(name: String) {
        let newtask = Task(name: name)
        tasks.append(newtask)
    }
    
    func getNumberOfTasks() -> Int {
        return tasks.count
    }
    
    func getTaskAtIndex(index: Int) -> Task? {
        if index < 0 || index >= tasks.count {
            return nil
        }
        return tasks[index]
    }
    
}
