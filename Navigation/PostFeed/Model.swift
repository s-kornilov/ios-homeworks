import UIKit

class FeedModel {
    var secretWord: String = "pass"
    
    func check(word: String) -> Bool {
        guard secretWord == word else {return false}
        return true
    }
}
