//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by cresh on 11/07/2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor = .blue
        self.cardLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var profilePhoto: UIImageView = {
        //let profilePhoto = UIImageView(image: UIImage(named: "ss.jpg"))
        let profilePhoto = UIImageView(image: UIImage(named: "profilePhoto"))
        //profilePhoto.backgroundColor = .red
        profilePhoto.layer.cornerRadius = profilePhoto.frame.size.width / 3
        profilePhoto.clipsToBounds = true
        profilePhoto.layer.borderWidth = 3
        profilePhoto.layer.borderColor = UIColor.white.cgColor
        return profilePhoto
    }()
    
    private lazy var profileName: UILabel = {
        let profileName = UILabel()
        //profileName.backgroundColor = .yellow
        profileName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        profileName.textColor = .black
        profileName.text = "Rocky Balboa"
        return profileName
    }()
    
    private var statusText:String = ""
    
    private lazy var profileStatus: UILabel = {
        let profileStatus = UILabel()
        //profileStatus.backgroundColor = .yellow
        profileStatus.textColor = .gray
        profileStatus.text = "waiting for something..."
        return profileStatus
        
    }()
    
    private lazy var profileStatusButton: UIButton = {
        let profileStatusButton = UIButton()
        profileStatusButton.backgroundColor = .blue
        profileStatusButton.layer.cornerRadius = 4
        profileStatusButton.setTitle("Show status", for: .normal)
        profileStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        profileStatusButton.layer.shadowOffset.width = 4
        profileStatusButton.layer.shadowOffset.height = 4
        profileStatusButton.layer.shadowColor = UIColor.black.cgColor
        profileStatusButton.layer.shadowRadius = 4
        profileStatusButton.layer.shadowOpacity = 0.7
        return profileStatusButton
    }()
    
    @objc func buttonPressed() {
        print("Устовлен новый статус: \(statusText)")
        profileStatus.text = statusText
        statusChangeField.text?.removeAll()
    }
    
    private lazy var statusChangeField: UITextField = {
        let statusChangeField = UITextField()
        statusChangeField.backgroundColor = .white
        statusChangeField.layer.cornerRadius = 12
        statusChangeField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusChangeField.textColor = .black
        statusChangeField.layer.borderWidth = 1
        statusChangeField.layer.borderColor = UIColor.black.cgColor
        statusChangeField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return statusChangeField
    }()
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = statusChangeField.text!
        profileStatus.text = statusText
        print(statusText)
    }
    
    
    
    private func cardLayout() {
        let screenSize = UIScreen.main.bounds.size
        
        self.profilePhoto.frame = CGRect(x: 16,
                                         y: 16,
                                         width: 100,
                                         height: 100)
        
        self.profileName.frame = CGRect(x: 130,
                                        y: 27,
                                        width: screenSize.width - 145,
                                        height: 21)
        
        self.profileStatus.frame = CGRect(x: 130,
                                          y: 98,
                                          width: screenSize.width - 145,
                                          height: 21)
        
        self.statusChangeField.frame = CGRect(x: 130,
                                          y: 55,
                                          width: screenSize.width - 145,
                                          height: 40)
        
        self.profileStatusButton.frame = CGRect(x: 16,
                                                y: 132,
                                                width: screenSize.width - 32,
                                                height: 50)
        
        self.addSubview(self.profilePhoto)
        self.addSubview(self.profileName)
        self.addSubview(self.statusChangeField)
        self.addSubview(self.profileStatus)
        self.addSubview(self.profileStatusButton)
    }
    
    
}
