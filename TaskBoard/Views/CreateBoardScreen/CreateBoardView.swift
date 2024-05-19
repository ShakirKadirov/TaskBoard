//
//  CreateBoardView.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import UIKit

class CreateBoardView: UIView {
    
    var buttonHandler: (()->Void)?
    private let manager = DataBaseManager()
    private let settingsView = SettingsView()


    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter board title"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var createButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
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
        addSubview(titleTextField)
        addSubview(createButton)
        setConstraints()
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleTextField.heightAnchor.constraint(equalToConstant: 44),

            
            createButton.heightAnchor.constraint(equalToConstant: 44),
            createButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            createButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            createButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    @objc func createButtonTapped() {
        guard let title = titleTextField.text, !title.isEmpty else {
            print("Title is empty")
            return
        }
        let board = Board(title: title)
        
        manager.createBoard(board: board)
        
        buttonHandler?()
    }
}

