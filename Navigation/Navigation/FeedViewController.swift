import UIKit

class FeedViewController: UIViewController {
    var post = Post(title: "Новый пост")
    
    //MARK: Make buttons
    private lazy var firstButton: UIButton = {
        let firstButton = UIButton()
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.backgroundColor = UIColor(red: 238.0/255, green: 108.0/255, blue: 77.0/255, alpha: 1.0)
        firstButton.layer.cornerRadius = 15
        firstButton.setTitle("Go to post 1", for: .normal)
        firstButton.setTitleColor(.white, for: .normal)
        firstButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        firstButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return firstButton
    }()
    
    private lazy var secondButton: UIButton = {
        let secondButton = UIButton()
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.backgroundColor = UIColor(red: 238.0/255, green: 108.0/255, blue: 77.0/255, alpha: 1.0)
        secondButton.layer.cornerRadius = 15
        secondButton.setTitle("Go to post 2", for: .normal)
        secondButton.setTitleColor(.white, for: .normal)
        secondButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        secondButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return secondButton
    }()
    
    //MARK: Make group of buttons
    private var stackView: UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 10.0
        
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        
        return stackView
    }
    
    //MARK: Some actions
    @objc private func buttonAction() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titlePost = post.title
    }
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 152.0/255, green: 193.0/255, blue: 217.0/255, alpha: 1.0)
        self.title = "Feed"
        
        view.addSubview(stackView)
        
        
        setupConstraints()
    }
    
    //MARK: Setup constaints
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            firstButton.centerYAnchor.constraint(equalTo: safeAreaGuide.centerYAnchor),
            
            firstButton.widthAnchor.constraint(equalToConstant: 150),
            firstButton.heightAnchor.constraint(equalToConstant: 50),
            secondButton.widthAnchor.constraint(equalToConstant: 150),
            secondButton.heightAnchor.constraint(equalToConstant: 50)
            
            //При попытке выставить constraint для стека:
            
            //stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            //stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            
            //
            //Thread 1: EXC_BREAKPOINT (code=1, subcode=0x10698acdc)
            //и в консоле
            // Navigation[44058:1576430] *** -[UIStackView nsli_layoutEngine]: message sent to deallocated instance 0x14aa24580
            //обясните, из-за чего происходит эта ошибка?
            
        ])
        
        
    }
}

