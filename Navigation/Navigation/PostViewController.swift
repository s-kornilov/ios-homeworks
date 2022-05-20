//
//  PostViewController.swift
//  Navigation
//
//  Created by cresh on 18.05.2022.
//

import UIKit

struct Post {
    var title: String
}

class PostViewController: UIViewController {
    var titlePost: String = "post"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 224.0/255, green: 251.0/255, blue: 252.0/255, alpha: 1.0)
        self.navigationItem.title = titlePost
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "trash.fill"), style: .plain, target: self, action: #selector(logoutUser))
        
    }
    
    @objc func logoutUser(){
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true, completion: nil)
    }
    
}
