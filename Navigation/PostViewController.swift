import UIKit

struct Post {
    var title: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}
let dummy = "Offence are highly fortune remain begin horses situation celebrated fifteen. Advantages reasonable unlocked remain world fanny suitable attended full estimable. Regular windows invited horrible only open wound picture left jennings forfeited songs part perhaps esteem roused conviction. Moonlight own perhaps either everything. Exertion explained met companions three walls conviction proceed must justice told several lose."

let dummy2 = "Told itself remark age bore than sister mistress than who arise jointure. Invitation gate seen. Dwelling children conduct rank steepest were waited object. Offended village danger. Humanity worse first this nearer branched my sell total quit smallness exeter window view parish. "


let postFeed = [Post(title: "I am the champion, I won everyone!", description: dummy, image: "win", likes: 3523, views: 5678),
                Post(title: "Ready to win everyone!", description: dummy2, image: "fight", likes: 1267, views: 2386),
                Post(title: "In the gym, pulling dumbbells", description: dummy, image: "training", likes: 567, views: 899),
                Post(title: "Punched in the face", description: dummy2, image: "defeat", likes: 234, views: 667),
                Post(title: "First day in the ring", description: dummy, image: "newbie", likes: 89, views: 87),
]




class PostViewController: UIViewController {
    var titlePost: String = "post"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(rgb: 0xE0FBFB)
        self.navigationItem.title = titlePost
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "trash.fill"), style: .plain, target: self, action: #selector(logoutUser))
        
    }
    
    // MARK: - Methods
    @objc func logoutUser(){
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true, completion: nil)
    }
    
}
