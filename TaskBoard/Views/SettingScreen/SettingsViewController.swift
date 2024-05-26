//
//  SettingsViewController.swift
//  TaskBoard
//
//  Created by Shakir Kadirov on 18.05.2024.
//

import UIKit
import RealmSwift

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let settingsView = SettingsView()
    
    override func loadView() {
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Добавляем обработчик нажатия на кнопку
        settingsView.uploadButton.addTarget(self, action: #selector(didTapUploadButton), for: .touchUpInside)
    }
    
    @objc private func didTapUploadButton() {
        settingsView.presentImagePicker(from: self)
    }
    
    // MARK: - UIImagePickerControllerDelegate methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            settingsView.profileImageView.image = pickedImage
            // Сохранение изображения в базу данных
            saveProfileImageToDatabase(image: pickedImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    private func saveProfileImageToDatabase(image: UIImage) {
        // Преобразование UIImage в Data
        if let imageData = image.jpegData(compressionQuality: 0.8) {
            let profileImage = ProfileImage()
            profileImage.imageData = imageData
            let databaseManager = DataBaseManager()
            databaseManager.saveProfileImage(profileImage)
        }
    }
}


extension SettingsView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentImagePicker(from viewController: UIViewController) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        viewController.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            profileImageView.image = pickedImage
            // Сохранение изображения в базу данных
            saveProfileImageToDatabase(image: pickedImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    private func saveProfileImageToDatabase(image: UIImage) {
        // Преобразование UIImage в Data
        if let imageData = image.jpegData(compressionQuality: 0.8) {
            let profileImage = ProfileImage()
            profileImage.imageData = imageData
            let databaseManager = DataBaseManager()
            databaseManager.saveProfileImage(profileImage)
        }
    }
}




