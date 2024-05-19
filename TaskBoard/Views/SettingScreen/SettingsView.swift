//
//  SettingsView.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 19.05.2024.
//

import UIKit

class SettingsView: UIView {

    private let manager = DataBaseManager()
    weak var tableView: UITableView?
    var buttonHandler: (()->Void)?


    
    
    lazy var boardsCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        updateBoardsCount()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(boardsCountLabel)
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([

            boardsCountLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            boardsCountLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func updateBoardsCount() {
        // Извлекаем все доски из базы данных
        let boards = manager.getAllBoard()
        
        // Считаем количество дос
        let boardsCount = boards.count
        
        // Обновляем текст метки
        boardsCountLabel.text = "Total boards: \(boardsCount)"
    }


}
