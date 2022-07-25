import UIKit

class ProfileHeaderView: UIView {
    
    // MARK: - Private Properties
    private lazy var profilePhoto: UIImageView = {
        let profilePhoto = UIImageView(image: UIImage(named: "profilePhoto"))
        profilePhoto.translatesAutoresizingMaskIntoConstraints = false
        //profilePhoto.backgroundColor = .red
        profilePhoto.layer.cornerRadius = profilePhoto.frame.size.width / 3
        profilePhoto.clipsToBounds = true
        profilePhoto.layer.borderWidth = 3
        profilePhoto.layer.borderColor = UIColor.white.cgColor
        return profilePhoto
    }()
    
    private lazy var profileName: UILabel = {
        let profileName = UILabel()
        profileName.translatesAutoresizingMaskIntoConstraints = false
        //profileName.backgroundColor = .yellow
        profileName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        profileName.textColor = .black
        profileName.text = "Rocky Balboa"
        return profileName
    }()
    
    private var statusText:String = ""
    
    private lazy var profileStatus: UILabel = {
        let profileStatus = UILabel()
        profileStatus.translatesAutoresizingMaskIntoConstraints = false
        //profileStatus.backgroundColor = .yellow
        profileStatus.textColor = .gray
        profileStatus.text = "waiting for something..."
        return profileStatus
    }()
    
    private lazy var profileStatusButton: UIButton = {
        let profileStatusButton = UIButton()
        profileStatusButton.translatesAutoresizingMaskIntoConstraints = false
        profileStatusButton.backgroundColor = .blue
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
        statusChangeField.translatesAutoresizingMaskIntoConstraints = false
        statusChangeField.backgroundColor = .white
        statusChangeField.layer.cornerRadius = 12
        statusChangeField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusChangeField.textColor = .black
        statusChangeField.layer.borderWidth = 1
        statusChangeField.layer.borderColor = UIColor.black.cgColor
        statusChangeField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return statusChangeField
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor = .orange
        self.cardLayout()
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
    
    // MARK: - Setup position and subviews
    func cardLayout() {
        self.addSubview(profilePhoto)
        self.addSubview(profileName)
        self.addSubview(statusChangeField)
        self.addSubview(profileStatus)
        self.addSubview(profileStatusButton)
        setupConstraints()
    }
    
    // MARK: Setup constraints
    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        guard let superView = superview else { return }
        
        NSLayoutConstraint.activate([
            
            self.leftAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leftAnchor),
            self.rightAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.rightAnchor),
            self.topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
            //self.heightAnchor.constraint(equalToConstant: 220),
            
            profilePhoto.widthAnchor.constraint(equalToConstant: 100),
            profilePhoto.heightAnchor.constraint(equalTo: profilePhoto.widthAnchor),
            profilePhoto.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            profilePhoto.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            
            profileName.leftAnchor.constraint(equalTo: profilePhoto.rightAnchor, constant: 20),
            profileName.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            
            profileStatusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            profileStatusButton.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            profileStatusButton.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 42),
            profileStatusButton.heightAnchor.constraint(equalToConstant: 50),
            profileStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            profileStatus.leftAnchor.constraint(equalTo: profilePhoto.rightAnchor, constant: 20),
            profileStatus.bottomAnchor.constraint(equalTo: statusChangeField.topAnchor, constant: -6),
            profileStatus.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            
            statusChangeField.leftAnchor.constraint(equalTo: profilePhoto.rightAnchor, constant: 20),
            statusChangeField.bottomAnchor.constraint(equalTo: profileStatusButton.topAnchor, constant: -10),
            statusChangeField.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            statusChangeField.heightAnchor.constraint(equalToConstant: 40),
        ])
        self.setNeedsLayout()
    }
    
}
