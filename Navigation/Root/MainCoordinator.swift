import UIKit

enum AppFlow {
    case feed
    case login(Profile)
}

enum Profile {
    case profile
}

class MainCoordinator: Coordinator {
    var childs: [AppCoordinator] = []
    
    lazy var feedCoordinator: FeedCoordinator = FeedCoordinator()
    lazy var loginCoordinator: LoginCoordinator = LoginCoordinator()
    
    lazy var rootViewController: UIViewController = UITabBarController()
    
    func start() -> UIViewController {
        
        let feedViewController = feedCoordinator.start()
        feedCoordinator.parentCoordinator = self
        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "paperplane.fill"), tag: 0)
        
        let loginViewController = loginCoordinator.start()
        loginCoordinator.parentCoordinator = self
        loginViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.square"), tag: 1)
        
        (rootViewController as? UITabBarController)?.viewControllers = [feedViewController,loginViewController]
        
        return rootViewController
    }
}
