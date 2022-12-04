import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    //MARK: Set UI elements
    private lazy var galleryItem: UIImageView = {
        let galleryItem = UIImageView()
        galleryItem.toAutoLayout()
        return galleryItem
    }()
    
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews(galleryItem)
        useConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Functions
    public func setImage(_ name: UIImage) {
        galleryItem.image = name
    }
    
    // MARK: Set constraints
    private func useConstraints(){
        NSLayoutConstraint.activate([
            self.galleryItem.topAnchor.constraint(equalTo: self.topAnchor),
            self.galleryItem.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.galleryItem.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.galleryItem.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
