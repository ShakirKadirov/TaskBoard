//
//  HomeView.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import UIKit

class HomeView: UIView {
    
    var navigationController: UINavigationController?
    
    let tableData: [MokeData] = [
        MokeData(title: "one", color: .blue, date: "10 June"),
        MokeData(title: "two", color: .green, date: "10 Jan")
    ]
    
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
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = boardTableView.dequeueReusableCell(withIdentifier: BoardTableViewCell.reuseID, for: indexPath) as! BoardTableViewCell
        cell.setupCell(title: tableData[indexPath.row].title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let item = tableData[indexPath.row]
         
         let detail = DetailViewController()
         navigationController?.pushViewController(detail, animated: true)
     }

}
