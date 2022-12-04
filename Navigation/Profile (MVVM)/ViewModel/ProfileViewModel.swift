import UIKit

final class ProfileViewModel {
   
    let profileHeaderView = ProfileHeaderView()
    var postArray: [ProfilePostModel] = []
    var currentUser: UserService
    init(currentUser: UserService) {
        self.currentUser = currentUser
    }
    
    func setPosts() {
        postArray = postFeed
    }
}

