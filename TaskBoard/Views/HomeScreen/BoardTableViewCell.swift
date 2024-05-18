//
//  BoardTableViewCell.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import UIKit

class BoardTableViewCell: UITableViewCell {
    
    static let reuseID = "Cell"
    
    lazy var mainView: UIView = {
        let mainView = UIView()
        mainView.addSubview(titleLabel)
        mainView.addSubview(iconImageView)
        mainView.addSubview(dateLabel)
        mainView.backgroundColor = .systemGray4
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 8
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byClipping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var dateLabel: UILabel = {
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    

    func setupUI(){
        addSubview(mainView)
        setConstraints()
    }
    
    func setupCell(title: String, icon: UIImage?, date: Date){
        titleLabel.text = title
        iconImageView.image = icon
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy" // Формат даты по вашему желанию
        let dateString = dateFormatter.string(from: date)
        dateLabel.text = dateString
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            iconImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -16),
            
            dateLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 16),
            dateLabel.leadingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 50),
            dateLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
            dateLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
