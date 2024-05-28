//
//  BoardTableViewCell.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import UIKit

class BoardTableViewCell: UITableViewCell {
    
    static let reuseID = "Cell"
    
//    lazy var mainView: UIView = {
//        let mainView = UIView()
//        mainView.addSubview(titleLabel)
//        mainView.addSubview(iconImageView)
//        mainView.addSubview(dateLabel)
//        mainView.backgroundColor = .systemGray4
//        mainView.clipsToBounds = true
//        mainView.layer.cornerRadius = 8
//        mainView.translatesAutoresizingMaskIntoConstraints = false
//        return mainView
//    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byClipping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
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
        addSubview(titleLabel)
        addSubview(iconImageView)
        addSubview(dateLabel)
        setConstraints()
    }
    
    func setupCell(title: String, icon: UIImage?, date: Date){
        titleLabel.text = title
        iconImageView.image = icon
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        let dateString = dateFormatter.string(from: date)
        dateLabel.text = dateString
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([

            
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
