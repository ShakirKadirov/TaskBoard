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
    
    func createBoard(board: Board) {
        do {
            try realm.write {
                realm.add(board)
            }
            
            getBoard()
        } catch {
            print("Error creating board: \(error.localizedDescription)")
        }
    }

    func deleteBoard(board: Board) {
           do {
               try realm.write {
                   realm.delete(board)
               }
               getBoard()
           } catch {
               print("Error deleting board: \(error.localizedDescription)")
           }
       }
    
    func getBoard(){
        let allBoard = realm.objects(Board.self)
         
        self.boards = Array(allBoard)
    }
    
    func getAllBoard() -> Int {
          return realm.subscriptions.count
      }
    
    
    func saveProfileImage(_ profileImage: ProfileImage) {
        do {
            try realm.write {
                realm.add(profileImage)
            }
        } catch {
            print("Error saving profile image: \(error.localizedDescription)")
        }
    }
    
    // Извлечение изображения профиля
    func getProfileImage() -> ProfileImage? {
        return realm.objects(ProfileImage.self).first
    }
}
