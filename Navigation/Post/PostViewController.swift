import UIKit

class PostViewController: UIViewController {
    var titlePost: String = "post"
    
    //MARK: Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(rgb: 0xE0FBFB)
        self.navigationItem.title = titlePost
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "trash.fill"), style: .plain, target: self, action: #selector(logoutUser))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "trash.fill"), style: .plain, target: self, action: #selector(logoutUser))
        }
        
    }
    
    // MARK: Functions
    @objc func logoutUser(){
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true, completion: nil)
    }
    
}
