import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Private Properties
    private lazy var buttonChangeTitle: UIButton = {
        let buttonChangeTitle = UIButton()
        buttonChangeTitle.backgroundColor = UIColor(rgb: 0xEE6C4D)
        buttonChangeTitle.center = self.view.center
        buttonChangeTitle.setTitle("Change title", for: .normal)
        buttonChangeTitle.setTitleColor(.white, for: .normal)
        buttonChangeTitle.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        buttonChangeTitle.addTarget(self, action: #selector(changeTitle), for: .touchUpInside)
        buttonChangeTitle.translatesAutoresizingMaskIntoConstraints = false
        return buttonChangeTitle
    }()

    private lazy var profileCard: ProfileHeaderView = {
        let profileCard = ProfileHeaderView()
        return profileCard
    }()
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileCard);
        profileCard.cardLayout()
        view.addSubview(buttonChangeTitle);
        setupConstraintsForButton()
    }
    
    // MARK: - Methods
    @objc func changeTitle(){
        self.title = "Title is changed"
    }
    
    private func setupConstraintsForButton() {
            NSLayoutConstraint.activate([
                buttonChangeTitle.leftAnchor.constraint(equalTo: view.leftAnchor),
                buttonChangeTitle.rightAnchor.constraint(equalTo: view.rightAnchor),
                buttonChangeTitle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                buttonChangeTitle.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    
}
