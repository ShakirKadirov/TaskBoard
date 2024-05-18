//
//  CreateBoardViewController.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import UIKit

class CreateBoardViewController: UIViewController {
    
    var backButton: UIBarButtonItem!
    
    private let createBoardView = CreateBoardView()
    
    override func loadView() {
        view = createBoardView
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Create Board"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil) // Закрытие текущего контроллера
    }
}
