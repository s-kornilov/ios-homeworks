import UIKit

class User {
    var login: String
    var password: String
    var fullName: String
    var avatar: UIImage?
    var status: String
    
    init(login: String, password: String, fullName: String, avatar: UIImage?, status: String) {
        self.login = login
        self.password = password
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}

protocol UserService {
    func userSetup(_ login: String) -> User?
}

class CurrentUserService: UserService {
    private let userData2 = userData
    
    func userSetup(_ login: String) -> User? {
        if let findUser = userData.first(where: { $0.login == login }) {
            return findUser
        }
        return nil
    }
}

class TestUserService: UserService {
    private let testUser = User(login: "donkey", password: "pass", fullName: "Donkey Test", avatar: UIImage(named: "donkey"), status: "iu-ah-ah")
    
    func userSetup(_ login: String) -> User? {
        return testUser
    }
}

func Auth(login: String, password: String) -> Bool {
    if (userData.first(where: { $0.login == login && $0.password == password }) != nil)  {
        return true
    }
    else {
        return false
    }
}

let userData = [
    User(login: "rocky", password: "pass", fullName: "Rocky Balboa", avatar: UIImage(named: "rocky"), status: "waiting for something"),
    User(login: "shrek", password: "pass", fullName: "Shrek", avatar: UIImage(named: "shrek"), status: "woohaa-a-a-a")]
