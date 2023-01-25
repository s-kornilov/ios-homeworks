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
    
    var counter:Float = 0.00
    var timer = Timer()
    
    //MARK: Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Photo Gallery"
        navigationController?.navigationBar.isHidden = false
        view.addSubviews(self.collectionView)
        otherThread()
        useConstraints()
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
        startTimer()
        let imageProcessor = ImageProcessor()
        imageProcessor.processImagesOnThread(sourceImages: galleryList, filter: .colorInvert, qos: .default) { cgImages in
            let images = cgImages.map({UIImage(cgImage: $0!)})
            newGalleryList.removeAll()
            images.forEach({newGalleryList.append($0)})
            DispatchQueue.main.async{
                self.collectionView.reloadData()
                self.timer.invalidate()
            }
            
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        counter += 0.01
        print (counter)
    }
    
    // filter = colorInvert
    /*
     .default = 1.91 s
     .background = 9.33 s
     .userInitiated = 1.96 s
     .userInteractive =  1.95 ms
     .utility = 2.10 s
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
