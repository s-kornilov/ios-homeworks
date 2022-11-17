import UIKit

// MARK: - UIView ext
public extension UIView {

    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
    func makeSpace(inField: UITextField) {
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        inField.leftViewMode = .always
        inField.leftView = spacerView
        inField.rightViewMode = .always
        inField.rightView = spacerView
    }
    
}

// MARK: - UIColor ext
extension UIColor {
    convenience init(rgb: UInt) {
        self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgb & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
    }
}
// MARK: - UIImage ext
extension UIImage {
    func imageWithAlpha(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
}
