import UIKit

class InfoViewController: UIViewController {
    
    //MARK: Set UI elements
    
    private lazy var infoTitle: UILabel = {
        let infoTitle = UILabel()
        infoTitle.toAutoLayout()
        infoTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        infoTitle.textColor = .black
        infoTitle.numberOfLines = 4
        infoTitle.text = "..."
        return infoTitle
    }()
    
    private lazy var planetInfo: UILabel = {
        let planetInfo = UILabel()
        planetInfo.toAutoLayout()
        planetInfo.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        planetInfo.textColor = .black
        planetInfo.numberOfLines = 4
        planetInfo.text = "..."
        return planetInfo
    }()
    
    private lazy var deleteButton: UIButton = {
        let deleteButton = UIButton()
        deleteButton.backgroundColor = UIColor(rgb: 0xEE6B4D)
        deleteButton.layer.cornerRadius = 15
        deleteButton.center = self.view.center
        deleteButton.setTitle("Удалить пост", for: .normal)
        deleteButton.setTitleColor(.white, for: .normal)
        deleteButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        deleteButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        return deleteButton
    }()
    
    
    //MARK: Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(infoTitle, deleteButton, planetInfo)
        useConstraints()
        view.backgroundColor = UIColor(rgb: 0xccd9ff)
        
        getStatus { statusTitle, errorText in
            DispatchQueue.main.async {
                if statusTitle != nil {
                    self.infoTitle.text = statusTitle
                }
                if errorText != nil {
                    print("Ошибка")
                } else {
                    print("no status")
                }
            }
        }
        
        getPlanet { planet, errorText in
            DispatchQueue.main.async {
                if planet != nil {
                    print("\n#\n")
                    self.planetInfo.text = ("Планета: \((planet?.name)!), орбитальный период: \((planet?.orbitalPeriod)!) дня")
                }
                if errorText != nil {
                    print("Ошибка getPlanet: \(String(describing: errorText))")
                } else {
                    print("\n#\tno status")
                }
            }
        }
        
    }
    
    private func useConstraints(){
        NSLayoutConstraint.activate([
            infoTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            infoTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoTitle.widthAnchor.constraint(equalToConstant: 200),
            infoTitle.heightAnchor.constraint(equalToConstant: 150),
            
            deleteButton.topAnchor.constraint(equalTo: infoTitle.bottomAnchor, constant: 20),
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteButton.widthAnchor.constraint(equalToConstant: 150),
            deleteButton.heightAnchor.constraint(equalToConstant: 50),
            
            planetInfo.topAnchor.constraint(equalTo: deleteButton.bottomAnchor, constant: 150),
            planetInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            planetInfo.widthAnchor.constraint(equalToConstant: 200),
            planetInfo.heightAnchor.constraint(equalToConstant: 150),
            
            
        ])
    }
    
    
    // MARK: - Functions
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
    
}
