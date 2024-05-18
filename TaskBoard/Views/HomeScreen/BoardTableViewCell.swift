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
        label.numberOfLines = 0 
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    func setupUI(){
        addSubview(titleLabel)
        setConstraints()
    }
    
    func setupCell(title: String){
        titleLabel.text = title
    }
    func setConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
