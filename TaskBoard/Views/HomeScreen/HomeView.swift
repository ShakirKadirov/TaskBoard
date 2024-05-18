//
//  HomeView.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import UIKit

class HomeView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

        ])
    }
}
