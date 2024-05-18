//
//  ViewController.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let manager = DataBaseManager()
    
    let homeView = HomeView()
    var addButton: UIBarButtonItem!
    
    
    override func loadView() {
        view = homeView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Home page"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func createButtonTapped() {
        print("createButtonTapped")
        
        let createBoardViewController = CreateBoardViewController()
        createBoardViewController.buttonHandler = { [weak self] in
            self?.homeView.manager.getBoard()
            self?.homeView.boardTableView.reloadData()
        }
        
        let navBar = UINavigationController(rootViewController: createBoardViewController)
        navBar.modalPresentationStyle = .fullScreen
        
        present(navBar, animated: true, completion: nil)
    }

}
