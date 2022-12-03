import UIKit

protocol LoginFactory {
    func returnLoginInspector() -> LoginInspector
}

class MyLoginFactory: LoginFactory {
    static let shared = MyLoginFactory()

    func returnLoginInspector() -> LoginInspector {
        let inspector = LoginInspector()
        return inspector
    }
}
