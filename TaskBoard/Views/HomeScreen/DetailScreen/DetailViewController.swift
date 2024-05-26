//
//  DetailViewController.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        detailView.createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func createButtonTapped() {
        
    }
}
