import UIKit

class ProfileCoordinator: Coordinator {
    var childs: [AppCoordinator] = []
    
    var parentCoordinator: LoginCoordinator?
    
    lazy var rootViewController: UIViewController = UIViewController()
    let userData: UserService?
    let userLogin: String?
    
    init(userData: UserService, userLogin: String) {
        self.userData = userData
        self.userLogin = userLogin
    }
    
    func start() -> UIViewController {
        let profileViewModel = ProfileViewModel(currentUser: userData!)
        rootViewController = ProfileViewController(userData: userData!, userLogin: userLogin!, coordinator: self, profileViewModel: profileViewModel)
        return rootViewController
    }
    
}
