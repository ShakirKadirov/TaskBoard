//
//  Board.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import Foundation
import RealmSwift

class Board: Object {
    @Persisted var title: String = ""
    @Persisted var date: Date = Date()
    
    convenience init(title: String) {
        self.init()
        self.title = title
    }
}

