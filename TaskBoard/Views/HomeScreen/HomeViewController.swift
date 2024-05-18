//
//  ViewController.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
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
        
        let createBoardViewController = UINavigationController(rootViewController: CreateBoardViewController())
        createBoardViewController.modalPresentationStyle = .fullScreen
        
        present(createBoardViewController, animated: true, completion: nil)
    }

}
