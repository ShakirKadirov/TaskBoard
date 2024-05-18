//
//  HomeView.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import UIKit

class HomeView: UIView {
    
    var navigationController: UINavigationController?
    let manager = DataBaseManager()
    
    lazy var boardTableView: UITableView = {
        let table = UITableView()
        table.register( BoardTableViewCell.self, forCellReuseIdentifier: BoardTableViewCell.reuseID)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        addSubview(boardTableView)
        setConstraints()
    }
    
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            boardTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            boardTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            boardTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            boardTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
}


extension HomeView: UITableViewDelegate, UITableViewDataSource{
    
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
        let cell = boardTableView.dequeueReusableCell(withIdentifier: BoardTableViewCell.reuseID, for: indexPath) as! BoardTableViewCell
        let board = manager.boards[indexPath.row]
        cell.setupCell(title: board.title, icon: UIImage(systemName: "folder.fill"), date: board.date)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // Устанавливаем высоту ячейки 100 точек
    }
    

}
