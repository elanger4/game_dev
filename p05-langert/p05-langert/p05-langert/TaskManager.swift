//
//  TaskManager.swift
//  p05-langert
//
//  Created by Erik Langert on 3/24/17.
//  Copyright © 2017 Erik Langert. All rights reserved.
//

import UIKit

var taskMgr: TaskManager = TaskManager()

struct task {
    var name = "Unnamed"
    var description = "Undescribed"
}

class TaskManager: NSObject {

    var tasks = [task]()
    
    func addTask(name: String, description: String) {
        tasks.append(task(name: name, description: description))
    }
}
