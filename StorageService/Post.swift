import Foundation

public struct Post {
    public var title: String
    public var description: String
    public var image: String
    public var likes: Int
    public var views: Int
}
let dummy = "Offence are highly fortune remain begin horses situation celebrated fifteen. Advantages reasonable unlocked remain world fanny suitable attended full estimable. Regular windows invited horrible only open wound picture left jennings forfeited songs part perhaps esteem roused conviction. Moonlight own perhaps either everything. Exertion explained met companions three walls conviction proceed must justice told several lose."

let dummy2 = "Told itself remark age bore than sister mistress than who arise jointure. Invitation gate seen. Dwelling children conduct rank steepest were waited object. Offended village danger. Humanity worse first this nearer branched my sell total quit smallness exeter window view parish. "

public let galleryList = ["1","2","3","4","5","6","7","8","9","10",
                    "11","12","13","14","15","16","17","18","19","20"]

public let postFeed = [Post(title: "I am the champion, I won everyone!", description: dummy, image: "win", likes: 3523, views: 5678),
                Post(title: "Ready to win everyone!", description: dummy2, image: "fight", likes: 1267, views: 2386),
                Post(title: "In the gym, pulling dumbbells", description: dummy, image: "training", likes: 567, views: 899),
                Post(title: "Punched in the face", description: dummy2, image: "defeat", likes: 234, views: 667),
                Post(title: "First day in the ring", description: dummy, image: "newbie", likes: 89, views: 87),
]

