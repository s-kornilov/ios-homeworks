import UIKit
import StorageService
import iOSIntPackage

class PhotosViewController: UIViewController {
    
    let imagePublisherFacade = ImagePublisherFacade()
    
    //MARK: Set UI elements
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView  = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.toAutoLayout()
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "photosCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    //MARK: Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Photo Gallery"
        navigationController?.navigationBar.isHidden = false
        view.addSubviews(self.collectionView)
        useConstraints()
        imagePublisherFacade.subscribe(self)
        imagePublisherFacade.addImagesWithTimer(time: 0.6, repeat: 20, userImages: galleryList)
    }
    
    // MARK: Set constraints
    private func useConstraints(){
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

//MARK: Extension VC
extension UIViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newGalleryList.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
        cell.setImage(newGalleryList[indexPath.item])
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: (collectionView.frame.width - 40) / 3,
            height: (collectionView.frame.width - 40) / 3)
    }
}

extension PhotosViewController: ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        images.forEach { image in
            if newGalleryList.contains(image) {
                return
            }
            else {
                newGalleryList.append(image)
            }
        }
        collectionView.reloadData()
    }
}
