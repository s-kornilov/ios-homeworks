import UIKit

class InfoViewController: UIViewController {
    // MARK: - Private Properties
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0xEE6B4D)
        button.layer.cornerRadius = 15
        button.center = self.view.center
        button.setTitle("Удалить пост", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setButton() {
        self.view.addSubview(self.button)
        self.button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // MARK: - Methods
    @objc func showAlert() {
        let alertMessage = UIAlertController(title: "Удаление", message: "Вы точно хотите удалить пост?", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Да", style: UIAlertAction.Style.default) { (action) -> Void in
            print("Нажали Да")
        }
        
        let cancel = UIAlertAction(title: "Нет", style: UIAlertAction.Style.cancel) { (action) -> Void in
            print("Нажали Нет")
        }
        
        alertMessage.addAction(ok)
        alertMessage.addAction(cancel)
        
        self.present(alertMessage, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        view.backgroundColor = UIColor.init(rgb: 0x96C1D8)
    }

}

