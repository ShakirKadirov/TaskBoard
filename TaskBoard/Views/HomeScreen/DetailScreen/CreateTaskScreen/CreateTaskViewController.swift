//
//  CreateTaskViewController.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 26.05.2024.
//

import UIKit

class CreateTaskViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Create note"
        navigationController?.navigationBar.prefersLargeTitles = true
    
        let closeBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeVC))

        navigationItem.rightBarButtonItem = closeBtn

    }
    
    
    @objc func closeVC() {
        dismiss(animated: true, completion: nil)
    }
    
}
