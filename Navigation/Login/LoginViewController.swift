import UIKit

protocol LoginViewControllerDelegate {
    func check(inputLogin: String, inputPassword: String) -> Bool
}

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var delegate: LoginViewControllerDelegate?
    var coordinator: LoginCoordinator?
    
    init(coordinator: LoginCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Set UI elements
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.toAutoLayout()
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.toAutoLayout()
        return contentView
    }()
    
    private lazy var logoVK: UIImageView = {
        let logoVK = UIImageView(image: UIImage(named: "logo"))
        logoVK.toAutoLayout()
        return logoVK
    }()
    
    private lazy var loginField: UITextField = {
        let loginField = UITextField()
        loginField.toAutoLayout()
        loginField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        loginField.tintColor = UIColor(named: "AccentColor")
        loginField.layer.borderColor = UIColor.lightGray.cgColor
        loginField.layer.borderWidth = 0.25
        loginField.textColor = .black
        loginField.autocapitalizationType = .none
        loginField.placeholder = "Email or phone"
        loginField.keyboardType = .default
        loginField.makeSpace(inField: loginField)
        return loginField
    }()
    
    private lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.toAutoLayout()
        passwordField.backgroundColor = UIColor(named: "AccentColor")
        passwordField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordField.tintColor = UIColor(named: "AccentColor")
        passwordField.layer.borderColor = UIColor.lightGray.cgColor
        passwordField.layer.borderWidth = 0.25
        passwordField.textColor = .black
        passwordField.placeholder = "password"
        passwordField.isSecureTextEntry = true
        passwordField.keyboardType = .default
        passwordField.autocapitalizationType = .none
        passwordField.makeSpace(inField: passwordField)
        return passwordField
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.clipsToBounds = true
        return stackView
    }()
    
    private lazy var logInButton: UIButton = {
        let logInButton = CustomButton(title: "Log In",
                                       titleColor: .white,
                                       bgColor: .blue,
                                       cornerRadius: 10)
        
        if let pixelImage = UIImage(named: "blue_pixel") {
            logInButton.setBackgroundImage(pixelImage.imageWithAlpha(alpha: 1), for: .normal)
            logInButton.setBackgroundImage(pixelImage.imageWithAlpha(alpha: 0.8), for: .selected)
            logInButton.setBackgroundImage(pixelImage.imageWithAlpha(alpha: 0.8), for: .highlighted)
            logInButton.setBackgroundImage(pixelImage.imageWithAlpha(alpha: 0.8), for: .disabled)
        }
        
        logInButton.clipsToBounds = true
        logInButton.addTarget(self, action: #selector(logInAction), for: .touchUpInside)
        return logInButton
    }()
    
    //MARK: Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(logoVK)
        contentView.addSubview(stackView)
        contentView.addSubview(logInButton)
        
        stackView.addArrangedSubview(loginField)
        stackView.addArrangedSubview(passwordField)
        
        loginField.delegate = self
        passwordField.delegate = self
        
        useConstrainsts()
        
        //Keyboard close in tap view
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: Functions
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
    
    @objc func logInAction(){
        let inspector = MyLoginFactory.shared.returnLoginInspector()
        self.delegate = inspector
        
#if DEBUG
        let userData = TestUserService()
#else
        let userData = CurrentUserService()
#endif
        if delegate?.check(inputLogin: "rocky", inputPassword: "pass") == true { //inputLogin: loginField.text!, inputPassword: passwordField.text!
            let profileCoordinator: ProfileCoordinator = ProfileCoordinator(userData: userData, userLogin: "rocky") // userLogin: loginField.text!
            let profileVC = profileCoordinator.start()
            self.navigationController?.pushViewController(profileVC, animated: true)
        } else {
            showAlert(cause: "Неверные логин/пароль")
        }
    }
    
    @objc private func showAlert(cause: String) {
        
        let alertMessage = UIAlertController(title: "Ошибка!", message: cause, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "Закрыть", style: UIAlertAction.Style.default)
        alertMessage.addAction(close)
        self.present(alertMessage, animated: true, completion: nil)
    }
    
    //MARK: Set constrainsts
    private func useConstrainsts() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
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
}