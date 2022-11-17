import UIKit

class FeedViewController: UIViewController {
    var model = FeedModel()
    
    //MARK: Set UI elements
    private lazy var firstButton: UIButton = {
        let firstButton = CustomButton(title: "Go to post 1",
                                       titleColor: UIColor(rgb: 0xFFFFFF),
                                       bgColor: UIColor(rgb: 0xEE6C4D),
                                       cornerRadius: 15)
        firstButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        firstButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return firstButton
    }()
    
    private lazy var secondButton: UIButton = {
        let secondButton = CustomButton(title: "Go to post 2",
                                        titleColor: UIColor(rgb: 0xFFFFFF),
                                        bgColor: UIColor(rgb: 0xEE6C4D),
                                        cornerRadius: 15)
        secondButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        secondButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return secondButton
    }()
    
    private var stackView: UIStackView {
        let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.clipsToBounds = true
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 10.0
        
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        
        return stackView
    }
    
    private lazy var someWordField: UITextField = {
        let someWordField = UITextField()
        someWordField.toAutoLayout()
        someWordField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        someWordField.tintColor = UIColor(named: "AccentColor")
        someWordField.backgroundColor = .white
        someWordField.layer.borderColor = UIColor.lightGray.cgColor
        someWordField.layer.borderWidth = 0.25
        someWordField.textColor = .black
        someWordField.autocapitalizationType = .none
        someWordField.placeholder = "some word"
        someWordField.keyboardType = .default
        someWordField.makeSpace(inField: someWordField)
        return someWordField
    }()
    
    private lazy var checkGuessButton: UIButton = {
        let checkGuessButton = CustomButton(title: "Check word",
                                            titleColor: UIColor(rgb: 0xFFFFFF),
                                            bgColor: UIColor(rgb: 0x7dba68),
                                            cornerRadius: 15)
        checkGuessButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        checkGuessButton.addTarget(self, action: #selector(checkWord), for: .touchUpInside)
        return checkGuessButton
    }()
    
    private lazy var checkWordLabel: UILabel = {
        let checkWordLabel = UILabel()
        checkWordLabel.toAutoLayout()
        //profileStatus.backgroundColor = .yellow
        checkWordLabel.textColor = .gray
        checkWordLabel.text = "result"
        return checkWordLabel
    }()
    
    //MARK: Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        
#if DEBUG
        view.backgroundColor = UIColor.init(rgb: 0x96C1D8)
#else
        view.backgroundColor = UIColor.init(rgb: 0xf9e1cb)
#endif
        
        self.title = "Feed"
        view.addSubviews(stackView, someWordField, checkGuessButton, checkWordLabel)
        useConstraints()
    }
    
    
    
    // MARK: Set constraints
    private func useConstraints() {
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.widthAnchor.constraint(equalToConstant: 150),
            firstButton.heightAnchor.constraint(equalToConstant: 50),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 20),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.widthAnchor.constraint(equalToConstant: 150),
            secondButton.heightAnchor.constraint(equalToConstant: 50),
            
            someWordField.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 200),
            someWordField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            someWordField.widthAnchor.constraint(equalToConstant: 150),
            someWordField.heightAnchor.constraint(equalToConstant: 50),
            
            checkGuessButton.topAnchor.constraint(equalTo: someWordField.bottomAnchor, constant: 20),
            checkGuessButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            checkGuessButton.widthAnchor.constraint(equalToConstant: 150),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 50),
            
            checkWordLabel.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor, constant: 20),
            checkWordLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            checkWordLabel.widthAnchor.constraint(equalToConstant: 50),
            checkWordLabel.heightAnchor.constraint(equalToConstant: 25),
        ])
    }
    
    //MARK: Some actions
    @objc func buttonAction() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    @objc func checkWord() {
        if model.check(word: someWordField.text!) == true {
            checkWordLabel.text = "TRUE"
            checkWordLabel.textColor = .green
        }
        else {
            checkWordLabel.text = "FALSE"
            checkWordLabel.textColor = .red
        }
    }
    
}
