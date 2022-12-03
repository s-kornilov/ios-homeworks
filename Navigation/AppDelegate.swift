import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window?.backgroundColor = .orange
        
        let mainCoordinator = MainCoordinator()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainCoordinator.start()
        window?.makeKeyAndVisible()
        return true
    }
    
    //MARK: Timer background
    var fromDate = Date()
    public func applicationDidEnterBackground(_ application: UIApplication) {
        print("app DidEnterBackground")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("app WillEnterForeground")
        let toDate = Date()
        let delta = toDate.timeIntervalSince(fromDate)
        print("Приложение было в фоне - \(delta) секунд")
    }
    
}
