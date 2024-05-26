//
//  ProfileImage.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 26.05.2024.
//

import Foundation
import RealmSwift

class ProfileImage: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var imageData: Data? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
