import UIKit
import StorageService
import iOSIntPackage

class PhotosViewController: UIViewController {
    
    //let imagePublisherFacade = ImagePublisherFacade()
    
    
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
    
    var timerCount = 0.0
    var timer: Timer? = nil
    
    //MARK: Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Photo Gallery"
        navigationController?.navigationBar.isHidden = false
        view.addSubviews(self.collectionView)
        useConstraints()
        
        calculateTime {
            otherThread()
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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
    
    private func otherThread() {
        let imageProcessor = ImageProcessor()
        imageProcessor.processImagesOnThread(sourceImages: galleryList, filter: .colorInvert, qos: .utility) { cgImages in
            let images = cgImages.map({UIImage(cgImage: $0!)})
            newGalleryList.removeAll()
            images.forEach({newGalleryList.append($0)})
            DispatchQueue.main.async{
                self.collectionView.reloadData()
            }
        }
    }
    
    func calculateTime(block : (() -> Void)) {
        let start = DispatchTime.now()
        block()
        let end = DispatchTime.now()
        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
        let timeInterval = Double(nanoTime) / 1_000_000
        print("\nTimer: \(timeInterval) ms")
    }
    // filter = colorInvert
    /*
     .default = 0.042125 ms
     .background = 0.024875 ms
     .userInitiated = 0.057417 ms
     .userInteractive =  0.03375 ms
     .utility = 0.047542 ms
     */
    
}

//MARK: Extension VC
extension UIViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newGalleryList.count
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
