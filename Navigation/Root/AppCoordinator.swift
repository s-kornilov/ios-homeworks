import UIKit

protocol AppCoordinator: AnyObject {
    var childs: [AppCoordinator] { get set }
}

protocol Coordinator: AppCoordinator {
    var rootViewController: UIViewController { get set }
    func start() -> UIViewController

}
