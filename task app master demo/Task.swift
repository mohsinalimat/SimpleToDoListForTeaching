//
//  Task.swift
//  task app master demo
//
//  Created by Dilraj Devgun on 12/2/17.
//  Copyright © 2017 Dilraj Devgun. All rights reserved.
//

import Foundation

class Task {
    private var taskName: String!
    private var date:Date!
    
    init(name: String) {
        self.taskName = name
        date = Date()
    }
    
    func getName() -> String {
        return taskName
    }
    
    func getDate() -> String {
        let locale = Locale(identifier: "en")
        return date.description(with: locale)
    }
}
