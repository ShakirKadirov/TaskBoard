//
//  Board.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import Foundation
import RealmSwift


class Board: Object {
    @Persisted(primaryKey: true) var id:String = UUID().uuidString
    @Persisted var title: String = ""
    @Persisted var date: Date = Date()
    // 
    @Persisted var tasks: List<Task>
    
}


class Task: Object{
    
}
