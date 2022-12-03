import UIKit

class ProfileCoordinator: Coordinator {
    var childs: [AppCoordinator] = []
    
    var parentCoordinator: MainCoordinator?
    
    lazy var rootViewController: UIViewController = UIViewController()
    let userData: UserService?
    let userLogin: String?
    
    init(userData: UserService, userLogin: String) {
        self.userData = userData
        self.userLogin = userLogin
    }
    
    func start() -> UIViewController {
        print("work at ProfileCoordinator")
        rootViewController = UINavigationController(rootViewController: ProfileViewController(userData: userData!, userLogin: userLogin!, coordinator: self))
        
        return rootViewController
    }
    
}
