import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabBarController = UITabBarController()
        
        func createFeedViewController() -> UINavigationController {
            let feedViewController = FeedViewController()
            feedViewController.title = "Лента"
            feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "paperplane.fill"), tag: 0)
            return UINavigationController(rootViewController: feedViewController)

        }
        func createProfileViewController() -> UINavigationController {
            let profileViewController = LogInViewController()
            profileViewController.title = "Профиль"
            profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.crop.square"), tag: 1)
            //profileViewController.navigationBar.isHidden = true
            return UINavigationController(rootViewController: profileViewController)

        }
        
        func createTabBarController() -> UITabBarController {
            UITabBar.appearance().backgroundColor = .white
            tabBarController.viewControllers = [createFeedViewController(), createProfileViewController()]
            return tabBarController
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
       // window?.backgroundColor = .orange
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()

        return true
    }

}

   



