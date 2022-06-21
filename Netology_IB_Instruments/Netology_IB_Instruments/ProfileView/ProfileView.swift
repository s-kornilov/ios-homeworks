//
//  ProfileView.swift
//  Netology_IB_Instruments
//
//  Created by cresh on 20.03.2022.
//

import UIKit

class ProfileView: UIView {
    @IBOutlet weak var ProfilePhoto: UIImageView!
    @IBOutlet weak var ProfileName: UILabel!
    @IBOutlet weak var ProfileBirthday: UILabel!
    @IBOutlet weak var ProfileCity: UILabel!
    @IBOutlet weak var ProfileBio: UITextView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    private func configureView() {
        let viewFromXib = self.loadViewFromXib()
        viewFromXib.frame = self.bounds
        viewFromXib.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(viewFromXib)
    }
    
    private func loadViewFromXib() -> UIView {
        guard let view = Bundle.main.loadNibNamed("ProfileView", owner: self, options: nil)?.first as? UIView else {
            return UIView()
        }
        return view
    }


    
}
