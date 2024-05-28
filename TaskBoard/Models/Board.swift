//
//  Board.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import Foundation
import RealmSwift

class Board: Object {
    @objc dynamic var title: String?
    @objc dynamic var date: Date = Date()
    let tasks = List<Task>() 
    
    convenience init(title: String) {
        self.init()
        self.title = title
    }
}


class Task: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var details: String?
    @objc dynamic var dueDate: Date?
}

