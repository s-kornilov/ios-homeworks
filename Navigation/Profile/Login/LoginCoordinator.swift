import UIKit

class LoginCoordinator: Coordinator {
    var childs: [AppCoordinator] = []
    
    var parentCoordinator: MainCoordinator?
    
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: LoginViewController(coordinator: self))
        
        let inspector = MyLoginFactory.shared.returnLoginInspector()
        let profileViewController = LoginViewController(coordinator: self)
        profileViewController.delegate = inspector
        
        return rootViewController
    }
    

}

