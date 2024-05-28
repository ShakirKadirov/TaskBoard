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
        
        let taskButton = UIBarButtonItem(title: "Add Task", style: .plain, target: self, action: #selector(createButtonTapped))
        navigationItem.rightBarButtonItem = taskButton
        
    }
    
    @objc func createButtonTapped() {
        let createTaskVC = CreateTaskViewController()
        let navigationController = UINavigationController(rootViewController: createTaskVC)
        present(navigationController, animated: true, completion: nil)

    }
}
