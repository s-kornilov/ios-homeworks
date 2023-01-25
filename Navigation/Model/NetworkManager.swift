import Foundation

struct NetworkManager {
    
    enum AppConfiguration {
        case peoples (String)
        case starships (URL)
        case planets (String)
    }
    
    public var urlArray: [AppConfiguration] = [
        .peoples("https://swapi.dev/api/people/8"),
        .starships(URL(string: "https://swapi.dev/api/starships/3")!),
        .planets("https://swapi.dev/api/planets/5")
    ]
    
    static func request (for configuration: AppConfiguration, completion: ((_ answerData: String?,
                                                                            _ statusCode: String?,
                                                                            _ errorText: String?,
                                                                            _ allHeaderFields:[AnyHashable : Any]?)->Void)? ) {
        var url = ""
        
        switch configuration {
        case .peoples(let string):
            url = string
        case .starships(let uRL):
            url = String(describing: uRL)
        case .planets(let string):
            url = string
        }
        
        guard let url = URL(string: url) else { return }
        
        let session = URLSession(configuration: .default)
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { data, responce, error in
            let allHeaders = (responce as? HTTPURLResponse)?.allHeaderFields
            let statusCode = (responce as? HTTPURLResponse)?.statusCode
            let statusResponce = String(describing: statusCode)
            
           // print("\n\nURL = \(url)")
            
            if error != nil {
                completion?(nil, nil, error?.localizedDescription, nil)
                return
            }
            
            if statusCode != 200 {
                print("Status code != 200, status code = \(String(describing: statusCode))")
                completion?(nil, statusResponce, error?.localizedDescription, nil)
                return
            }
            
            do {
                if let answer = try JSONSerialization.jsonObject(with: data!) as? [String: Any],
                   let nameAPI = answer["name"] as? String {
                    completion?(nameAPI, statusResponce, nil, allHeaders)
                }
            } catch {
                completion?(nil, statusResponce, error.localizedDescription,nil)
                print(error)
            }
        }
        task.resume()
    }
}

//Сообщение при отсутствии интернета

//2023-01-11 22:33:12.777222+0100 Navigation[8178:206494] Connection 1: received failure notification
//2023-01-11 22:33:12.777589+0100 Navigation[8178:206494] Connection 1: failed to connect 1:50, reason -1
//2023-01-11 22:33:12.777721+0100 Navigation[8178:206494] Connection 1: encountered error(1:50)
//2023-01-11 22:33:12.778402+0100 Navigation[8178:206494] Task <FFC2B87F-8E15-4C11-8BC0-D777EDB1CCD6>.<1> HTTP load failed, 0/0 bytes (error code: -1009 [1:50])
//2023-01-11 22:33:12.780257+0100 Navigation[8178:206494] Task <FFC2B87F-8E15-4C11-8BC0-D777EDB1CCD6>.<1> finished with error [-1009] Error Domain=NSURLErrorDomain Code=-1009 "The Internet connection appears to be offline." UserInfo={_kCFStreamErrorCodeKey=50, NSUnderlyingError=0x600003e217d0 {Error Domain=kCFErrorDomainCFNetwork Code=-1009 "(null)" UserInfo={_NSURLErrorNWPathKey=unsatisfied (No network route), _kCFStreamErrorCodeKey=50, _kCFStreamErrorDomainKey=1}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <FFC2B87F-8E15-4C11-8BC0-D777EDB1CCD6>.<1>, _NSURLErrorRelatedURLSessionTaskErrorKey=("LocalDataTask <FFC2B87F-8E15-4C11-8BC0-D777EDB1CCD6>.<1>"), NSLocalizedDescription=The Internet connection appears to be offline., NSErrorFailingURLStringKey=https://swapi.dev/api/starships/3, NSErrorFailingURLKey=https://swapi.dev/api/starships/3, _kCFStreamErrorDomainKey=1}

//Server error: Optional("The Internet connection appears to be offline.")

