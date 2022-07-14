//
//  InfoViewController.swift
//  Navigation
//
//  Created by cresh on 20.05.2022.
//

import UIKit

class InfoViewController: UIViewController {
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 238.0/255, green: 108.0/255, blue: 77.0/255, alpha: 1.0)
        button.layer.cornerRadius = 15
        button.center = self.view.center
        button.setTitle("Удалить пост", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setButton() {
        self.view.addSubview(self.button)
        self.button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func showAlert() {
        let alertMessage = UIAlertController(title: "Удаление", message: "Вы точно хотите удалить пост?", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Да", style: UIAlertAction.Style.default) { (action) -> Void in
            print("Нажали Да")
        }
        
        let cancel = UIAlertAction(title: "Нет", style: UIAlertAction.Style.cancel) { (action) -> Void in
            print("Нажали Нет")
        }
        
        alertMessage.addAction(ok)
        alertMessage.addAction(cancel)
        
        self.present(alertMessage, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        view.backgroundColor = UIColor(red: 246.0/255, green: 224.0/255, blue: 181.0/255, alpha: 1.0)
    }
    
}
