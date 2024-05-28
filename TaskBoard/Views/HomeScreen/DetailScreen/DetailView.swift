//
//  DetailView.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 26.05.2024.
//

import UIKit

class DetailView: UIButton {
    
    lazy var noteTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .red
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
        addSubview(noteTableView)
        setConstraints()
    }
    
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            noteTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            noteTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            noteTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            noteTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
