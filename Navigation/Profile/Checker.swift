import UIKit

final class Checker {
    static let shared = Checker()
    private init() {}
    
    private let log = "rocky"
    private let pass = "pass"
    
    func check(inputLogin: String, inputPassword: String) -> Bool {
        guard inputLogin == log && inputPassword == pass else {
            return false }
        return true
    }
}

class LoginInspector: LoginViewControllerDelegate {
    func check(inputLogin: String, inputPassword: String) -> Bool {
        return Checker.shared.check(inputLogin: inputLogin, inputPassword: inputPassword)
    }
}
