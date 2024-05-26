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
        
        homeView.boardTableView.delegate = self
        homeView.boardTableView.dataSource = self
    }
    
    @objc func createButtonTapped() {
        print("createButtonTapped")
        
        let createBoardViewController = CreateBoardViewController()
        createBoardViewController.buttonHandler = { [weak self] in
            self?.manager.getBoard()
            self?.homeView.boardTableView.reloadData()
        }
        
        let navBar = UINavigationController(rootViewController: createBoardViewController)
        navBar.modalPresentationStyle = .fullScreen
        
        present(navBar, animated: true, completion: nil)
    }

}

// MARK: UITableViewDelegate

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        manager.boards.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let boardToDelete = manager.boards[indexPath.row]
            manager.deleteBoard(board: boardToDelete)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeView.boardTableView.dequeueReusableCell(withIdentifier: BoardTableViewCell.reuseID, for: indexPath) as! BoardTableViewCell
        let board = manager.boards[indexPath.row]
        cell.setupCell(title: board.title!, icon: UIImage(systemName: "folder.fill"), date: board.date)


        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = manager.boards[indexPath.row].title
        print("didSelectRowAt")
        let detail = DetailViewController()
        navigationController?.pushViewController(detail, animated: true)
    }
}
