//
//  SettingsViewController.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let settingsView = SettingsView()
    
    override func loadView() {
        view = settingsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
