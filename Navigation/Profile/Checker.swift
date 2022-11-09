import UIKit

final class Checker {
    static let shared = Checker()
    private init() {}
    
     let log = "123"
     let pass = "123"
    
    func check(inputLogin: String, inputPassword: String) -> Bool {
        let log = "123"
        let pass = "123"
        guard inputLogin == log && inputPassword == pass else {
            print("##false at checker")
            return false }
        return true
    }
}

class LoginInspector: LoginViewControllerDelegate {
    func check(inputLogin: String, inputPassword: String) -> Bool {
        return Checker.shared.check(inputLogin: inputLogin, inputPassword: inputPassword)
    }
}
