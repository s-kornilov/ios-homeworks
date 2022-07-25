import UIKit

struct Post {
    var title: String
}

class PostViewController: UIViewController {
    var titlePost: String = "post"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(rgb: 0xE0FBFB)
        self.navigationItem.title = titlePost
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "trash.fill"), style: .plain, target: self, action: #selector(logoutUser))
        
    }
    
    // MARK: - Methods
    @objc func logoutUser(){
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true, completion: nil)
    }
    
}
