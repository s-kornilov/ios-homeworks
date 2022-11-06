import UIKit
import SnapKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    //MARK: Set UI elements
    private lazy var profilePhoto: UIImageView = {
        let profilePhoto = UIImageView(image: UIImage(named: "profilePhoto"))
        profilePhoto.toAutoLayout()
        profilePhoto.layer.cornerRadius = profilePhoto.frame.size.width / 3
        profilePhoto.clipsToBounds = true
        profilePhoto.layer.borderWidth = 3
        profilePhoto.layer.borderColor = UIColor.white.cgColor
        return profilePhoto
    }()
    
    private lazy var profileName: UILabel = {
        let profileName = UILabel()
        profileName.toAutoLayout()
        //profileName.backgroundColor = .yellow
        profileName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        profileName.textColor = .black
        profileName.text = "Rocky Balboa"
        return profileName
    }()
    
    private var statusText:String = ""
    
    private lazy var profileStatus: UILabel = {
        let profileStatus = UILabel()
        profileStatus.toAutoLayout()
        //profileStatus.backgroundColor = .yellow
        profileStatus.textColor = .gray
        profileStatus.text = "waiting for something..."
        return profileStatus
    }()
    
    private lazy var profileStatusButton: UIButton = {
        let profileStatusButton = UIButton()
        profileStatusButton.toAutoLayout()
        profileStatusButton.backgroundColor = UIColor(rgb: 0x0279FF)
        profileStatusButton.layer.cornerRadius = 4
        profileStatusButton.setTitle("Setup status", for: .normal)
        profileStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        profileStatusButton.layer.shadowOffset.width = 4
        profileStatusButton.layer.shadowOffset.height = 4
        profileStatusButton.layer.shadowColor = UIColor.black.cgColor
        profileStatusButton.layer.shadowRadius = 4
        profileStatusButton.layer.shadowOpacity = 0.7
        return profileStatusButton
    }()
    
    private lazy var statusChangeField: UITextField = {
        let statusChangeField = UITextField()
        statusChangeField.toAutoLayout()
        statusChangeField.backgroundColor = .white
        statusChangeField.layer.cornerRadius = 12
        statusChangeField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusChangeField.textColor = .black
        statusChangeField.layer.borderWidth = 1
        statusChangeField.layer.borderColor = UIColor.black.cgColor
        statusChangeField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        statusChangeField.makeSpace(inField: statusChangeField)
        return statusChangeField
    }()
    
    // MARK: Load view
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addSubviews(profilePhoto, profileName, statusChangeField, profileStatus,profileStatusButton)
        useConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Button actions
    @objc func buttonPressed() {
        print("Устовлен новый статус: \(statusText)")
        profileStatus.text = statusText
        statusChangeField.text?.removeAll()
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = statusChangeField.text!
        profileStatus.text = statusText
        print(statusText)
    }
    
    // MARK: Set constraints
    private func useConstraints() {
        profilePhoto.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
        }
        profileName.snp.makeConstraints { make in
            make.leading.equalTo(profilePhoto.snp.trailing).offset(20)
            make.top.equalToSuperview().offset(27)
        }
        
        profileStatus.snp.makeConstraints { make in
            make.leading.equalTo(profilePhoto.snp.trailing).offset(20)
            make.bottom.equalTo(statusChangeField.snp.top).offset(-6)
            make.trailing.greaterThanOrEqualToSuperview().offset(-16)
        }
        
        statusChangeField.snp.makeConstraints { make in
            make.leading.equalTo(profilePhoto.snp.trailing).offset(20)
            make.bottom.equalTo(profileStatusButton.snp.top).offset(-10)
            make.trailing.greaterThanOrEqualToSuperview().offset(-16)
            make.height.equalTo(40)
        }
        
        profileStatusButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(profilePhoto.snp.bottom).offset(42)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}
