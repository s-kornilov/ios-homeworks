import UIKit


class PostTableViewCell: UITableViewCell {
    
    //MARK: - Private Properties
    private lazy var postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.toAutoLayout()
        postImage.contentMode = .scaleAspectFit
        postImage.backgroundColor = .black
        postImage.clipsToBounds = true
        return postImage
    }()
    
    private lazy var postTitle: UILabel = {
        let postTitle = UILabel()
        postTitle.toAutoLayout()
        //postTitle.backgroundColor = .yellow
        postTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        postTitle.textColor = .black
        postTitle.numberOfLines = 2
        return postTitle
    }()
    
    
    private lazy var postDescription: UILabel = {
        let postDescription = UILabel()
        postDescription.toAutoLayout()
        //postDescription.backgroundColor = .yellow
        postDescription.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        postDescription.textColor = .systemGray
        postDescription.numberOfLines = 10
        return postDescription
    }()
    
    private lazy var postLikes: UILabel = {
        let postLikes = UILabel()
        postLikes.toAutoLayout()
        //postLikes.backgroundColor = .red
        postLikes.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        postLikes.textColor = .black
        return postLikes
    }()
    
    private lazy var postViews: UILabel = {
        let postViews = UILabel()
        postViews.toAutoLayout()
        //postViews.backgroundColor = .red
        postViews.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        postViews.textColor = .black
        return postViews
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(postTitle, postImage, postDescription, postLikes, postViews)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func setCell(post: Post) {
        self.postTitle.text = post.title
        self.postImage.image = UIImage(named: post.image)
        self.postDescription.text = post.description
        self.postLikes.text = "Likes: \(post.likes)"
        self.postViews.text = "Views: \(post.views)"
    }
    
    // MARK: Setup constraints
    private func setupConstraints(){
        toAutoLayout()
        NSLayoutConstraint.activate([
            postTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postTitle.heightAnchor.constraint(equalToConstant: 20),
            
            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
            postImage.topAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: 16),
            
            postDescription.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            postDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -36),
            postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            postLikes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            postLikes.heightAnchor.constraint(equalToConstant: 20),
            
            postViews.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            postViews.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
}
