import UIKit

class CustomButton: UIButton {
    
    let title: String
    let titleColor: UIColor
    let bgColor: UIColor
    let cornerRadius: Int
    
    init(title: String, titleColor: UIColor, bgColor:UIColor, cornerRadius: Int) {
        self.title = title
        self.titleColor = titleColor
        self.bgColor = bgColor
        self.cornerRadius = cornerRadius
        super.init(frame: .zero)
        
        self.toAutoLayout()
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = bgColor
        layer.cornerRadius = CGFloat(cornerRadius)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
