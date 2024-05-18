//
//  HomeView.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import UIKit

class HomeView: UIView {
    
    var navigationController: UINavigationController?
    
    private let manager = DataBaseManager()
    
    lazy var boardTableView: UITableView = {
        let table = UITableView()
        table.register( BoardTableViewCell.self, forCellReuseIdentifier: BoardTableViewCell.reuseID)
        table.delegate = self
        table.dataSource = self
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
        manager.getBoard().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = boardTableView.dequeueReusableCell(withIdentifier: BoardTableViewCell.reuseID, for: indexPath) as! BoardTableViewCell
        if let board = tableData?[indexPath.row] {
            cell.setupCell = manager.
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let item = tableData[indexPath.row]
         
         let detail = DetailViewController()
         navigationController?.pushViewController(detail, animated: true)
     }

}
