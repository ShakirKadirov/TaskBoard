//
//  DataBaseManager.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import Foundation
import RealmSwift

class DataBaseManager {
    
    let realm = try! Realm()
    
    var boards = [Board]()
    
     init() {
         getBoard()
     }
    
    func addBoard(board: Board) {
        do {
            try realm.write {
                realm.add(board)
            }
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    
    func getBoard() -> [Board]{
        let allBoard = realm.objects(Board.self)
         
        return Array(allBoard)
    }
     
}
