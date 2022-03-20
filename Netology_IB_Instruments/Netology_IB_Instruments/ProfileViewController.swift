//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by cresh on 20.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        if let defaultProfileView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
            defaultProfileView.frame = CGRect(x: 20, y: 30, width: screenWidth-40, height: screenHeight-20)
            view.addSubview(defaultProfileView)
        }
    }
    

   
}
