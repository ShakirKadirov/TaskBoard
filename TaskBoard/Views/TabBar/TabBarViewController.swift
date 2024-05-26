//
//  TabBarViewController.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.tabBarItem.image = UIImage(systemName: "house.fill")
        homeViewController.tabBarItem.title = "Home"
        
        let settingsViewController = UINavigationController(rootViewController: SettingsViewController())
        settingsViewController.tabBarItem.image = UIImage(systemName: "gearshape.fill")
        settingsViewController.tabBarItem.title = "Settings"


        
        tabBar.backgroundColor = .systemGray4
        viewControllers = [homeViewController, settingsViewController]
        
        self.tabBar.backgroundColor = .systemGray5
    }
}
