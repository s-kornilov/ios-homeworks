//
//  ProfileViewController.swift
//  Navigation
//
//  Created by cresh on 18.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    private lazy var profileCard: ProfileHeaderView = {
        let profileCard = ProfileHeaderView()
        return profileCard
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        self.view.addSubview(self.profileCard);
        
        profileCard.translatesAutoresizingMaskIntoConstraints = false
        profileCard.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        profileCard.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        profileCard.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        profileCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileCard.frame = CGRect(x: 0,
                                   y: 0,
                                   width: self.view.bounds.width,
                                   height: self.view.bounds.height);
        
        
    }
}
