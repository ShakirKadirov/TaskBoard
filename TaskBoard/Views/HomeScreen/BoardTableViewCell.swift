//
//  BoardTableViewCell.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import UIKit

class BoardTableViewCell: UITableViewCell {
    
    static let reuseID = "Cell"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
