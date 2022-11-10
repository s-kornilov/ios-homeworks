import UIKit
import StorageService

class PhotosTableViewCell: UITableViewCell {
    
    //MARK: Set UI elements
    private lazy var photoItem: UIImageView = {
        let photoItem = UIImageView()
        photoItem.toAutoLayout()
        photoItem.contentMode = .scaleAspectFit
        photoItem.backgroundColor = .black
        photoItem.clipsToBounds = true
        return photoItem
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.text = "Photos"
        title.textColor = .black
        title.font = .systemFont(ofSize: 24, weight: .bold)
        title.toAutoLayout()
        return title
    }()
    
    let rightArrow: UIImageView = {
        let rightArrow = UIImageView()
        rightArrow.toAutoLayout()
        rightArrow.image = UIImage(systemName: "arrow.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .regular, scale: .medium))?.withTintColor(.black, renderingMode: .alwaysOriginal)
        return rightArrow
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(title, rightArrow, stackView)
        attachPhoto()
        useConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Functions
    func attachPhoto() {
        for i in 0...3 {
            let gelleryPreview = UIImageView(image: UIImage(named: galleryList[i]))
            gelleryPreview.toAutoLayout()
            gelleryPreview.layer.cornerRadius = 6
            gelleryPreview.clipsToBounds = true
            stackView.addArrangedSubview(gelleryPreview)
        }
    }
    
    // MARK: Set constraints
    private func useConstraints(){
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            rightArrow.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            rightArrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            rightArrow.heightAnchor.constraint(equalTo: title.heightAnchor),
            rightArrow.widthAnchor.constraint(equalTo: title.heightAnchor),
            
            stackView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
        
        stackView.arrangedSubviews.forEach({
            [$0.widthAnchor.constraint(greaterThanOrEqualToConstant: (stackView.frame.width - 16) / 4),
            $0.heightAnchor.constraint(equalTo: $0.widthAnchor)].forEach({$0.isActive = true})
            })
    }
}
