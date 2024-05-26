//
//  HomeView.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import UIKit

class HomeView: UIView {
    
    let manager = DataBaseManager()
    private let settingsView = SettingsView()
    
    
    lazy var boardTableView: UITableView = {
        let table = UITableView()
        table.register( BoardTableViewCell.self, forCellReuseIdentifier: BoardTableViewCell.reuseID)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        addSubview(boardTableView)
        setConstraints()
    }
    
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            boardTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            boardTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            boardTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            boardTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
