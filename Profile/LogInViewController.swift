import UIKit

class LogInViewController: UIViewController {
    
    //MARK: - Public Properties
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    //MARK: - Private Properties
    private lazy var logoVK: UIImageView = {
        let logoVK = UIImageView(image: UIImage(named: "logo"))
        logoVK.translatesAutoresizingMaskIntoConstraints = false
        return logoVK
    }()
    
    private lazy var logInField: UITextField = {
        let logInField = UITextField()
        logInField.translatesAutoresizingMaskIntoConstraints = false
        
        logInField.backgroundColor = .systemGray6
        logInField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        logInField.tintColor = UIColor(named: "AccentColor")
        
        logInField.layer.borderColor = UIColor.lightGray.cgColor
        logInField.layer.borderWidth = 0.25
        logInField.textColor = .black
        logInField.autocapitalizationType = .none
        logInField.placeholder = "Email or phone"
        logInField.keyboardType = .default
        
        return logInField
    }()
    
    private lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordField.backgroundColor = .systemGray6
        passwordField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordField.tintColor = UIColor(named: "AccentColor")
        passwordField.layer.borderColor = UIColor.lightGray.cgColor
        passwordField.layer.borderWidth = 0.25
        passwordField.textColor = .black
        passwordField.placeholder = "password"
        passwordField.isSecureTextEntry = true

        passwordField.keyboardType = .default
        passwordField.autocapitalizationType = .none
        
        return passwordField
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.clipsToBounds = true
        
        return stackView
    }()
    
    private lazy var logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        if let pixelImage = UIImage(named: "blue_pixel") {
            logInButton.setBackgroundImage(pixelImage.imageWithAlpha(alpha: 1), for: .normal)
            logInButton.setBackgroundImage(pixelImage.imageWithAlpha(alpha: 0.8), for: .selected)
            logInButton.setBackgroundImage(pixelImage.imageWithAlpha(alpha: 0.8), for: .highlighted)
            logInButton.setBackgroundImage(pixelImage.imageWithAlpha(alpha: 0.8), for: .disabled)
        }
        
        logInButton.layer.cornerRadius = 10
        logInButton.clipsToBounds = true
        logInButton.setTitle("Log In", for: .normal)
        logInButton.tintColor = .white
        logInButton.addTarget(self, action: #selector(logInAction), for: .touchUpInside)
        return logInButton
    }()
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(logoVK)
        contentView.addSubview(stackView)
        contentView.addSubview(logInButton)
        
        stackView.addArrangedSubview(logInField)
        stackView.addArrangedSubview(passwordField)
        
        //Keyboard close in tap view
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
        setupConstrainsts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: Actions
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom = keyboardHeight ?? 0.0
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }
    
    //MARK: Methods
    private func setupConstrainsts() {
        let safeAreaguide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: safeAreaguide.topAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: safeAreaguide.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: safeAreaguide.trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: safeAreaguide.bottomAnchor),
                                     
                                     contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                                     contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     
                                     logoVK.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
                                     logoVK.widthAnchor.constraint(equalToConstant: 100),
                                     logoVK.heightAnchor.constraint(equalTo: logoVK.widthAnchor),
                                     logoVK.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                     
                                     stackView.topAnchor.constraint(equalTo: logoVK.bottomAnchor, constant: 120),
                                     stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                                     stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                                     stackView.heightAnchor.constraint(equalToConstant: 100),
                                     
                                     logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
                                     logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                                     logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                                     logInButton.heightAnchor.constraint(equalToConstant: 50),
                                    ])
    }
    
    
    @objc private  func logInAction(){
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    @objc func tap() {
        logInField.becomeFirstResponder()
        passwordField.resignFirstResponder()
        
    }
}

//MARK: Extensions
extension UIImage {
    func imageWithAlpha(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

