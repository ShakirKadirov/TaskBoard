//
//  SettingsView.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 19.05.2024.
//

import UIKit

class SettingsView: UIView {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let uploadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Upload Image", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .gray
        addSubview(profileImageView)
        addSubview(uploadButton)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20), 
            profileImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            uploadButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            uploadButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
}



