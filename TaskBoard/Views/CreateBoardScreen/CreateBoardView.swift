//
//  CreateBoardView.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import UIKit

class CreateBoardView: UIView {
    
    lazy var createButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Create", for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
           button.backgroundColor = .systemBlue
           button.setTitleColor(.white, for: .normal)
           button.layer.cornerRadius = 8
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        addSubview(createButton)
        setConstraints()
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            createButton.heightAnchor.constraint(equalToConstant: 44),
            createButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            createButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            createButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
