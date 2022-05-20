//
//  FeedViewController.swift
//  Navigation
//
//  Created by cresh on 18.05.2022.
//

import UIKit

class FeedViewController: UIViewController {
    var post = Post(title: "Новый пост")
    
    private lazy var button: UIButton = {
            let button = UIButton()
            button.backgroundColor = UIColor(red: 238.0/255, green: 108.0/255, blue: 77.0/255, alpha: 1.0)
            button.layer.cornerRadius = 15
            button.setTitle("Перейти на пост", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    private func setButton() {
            self.view.addSubview(self.button)
            self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
            self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
            self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    
    @objc private func buttonAction() {
            let postViewController = PostViewController()
            self.navigationController?.pushViewController(postViewController, animated: true)
            postViewController.titlePost = post.title
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        view.backgroundColor = UIColor(red: 152.0/255, green: 193.0/255, blue: 217.0/255, alpha: 1.0)
        
        
    }
    
}
