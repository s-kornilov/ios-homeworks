import UIKit

final class FeedModel {
    var secretWord: String = "pass"
    
    func check(word: String) {
            guard word != "" else { return }
            
            if word == secretWord {
                NotificationCenter.default.post(name: NSNotification.Name("markGreen"), object: nil)
            } else {
                NotificationCenter.default.post(name: NSNotification.Name("markRed"), object: nil)
            }
        }
    
}
