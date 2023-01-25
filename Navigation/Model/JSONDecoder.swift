import Foundation

//{
//  "userId": 1,
//  "id": 11,
//  "title": "vero rerum temporibus dolor",
//  "completed": true
//},

func getStatus(completion: ((_ statusText: String?, _ errorText: String?)->Void)? )  {
    let session = URLSession(configuration: .default)
    let randomInt = Int.random(in: 0..<60)
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos/\(randomInt)") //должна быть проверка на nil
    
    let task = session.dataTask(with: url!) {data, responce, error in
        
        if error != nil {
            completion?(nil, error?.localizedDescription)
            return
        }
        
        let statusCode = (responce as? HTTPURLResponse)?.statusCode
        if statusCode != 200 {
            print("Status code = \(String(describing: statusCode))")
            return
        }
        
        if data == nil {
            completion?(nil, "data = nil")
            return
        }
        
        do {
            if let status = try JSONSerialization.jsonObject(with: data!) as? [String: Any],
               let statusText = status["title"] as? String {
                print(statusText)
                completion?(statusText, nil)
                return
            }
        }catch {
            completion?(nil, error.localizedDescription)
            print(error)
        }
    }
    
    task.resume()
}



struct Planet: Decodable {
    let name: String
    let orbitalPeriod: String
    
    enum CodingKeys : String, CodingKey {
        case name
        case orbitalPeriod = "orbital_period"
    }
}

func getPlanet(completion: ((_ planet: Planet?, _ errorText: String?)->Void)? ){
    let session = URLSession(configuration: .default)
    let url = URL(string: "https://swapi.dev/api/planets/1") //должна быть проверка на nil
    
    let task = session.dataTask(with: url!) { data, response, error in
        if error != nil {
            completion?(nil, error?.localizedDescription)
            return
        }
        
        let statusCode = (response as? HTTPURLResponse)?.statusCode
        if statusCode != 200 {
            print("Status code != 200, status code = \(String(describing: statusCode))")
            return
        }
        
        if data == nil {
            completion?(nil, "data = nil")
            return
        }
        
        do {
            let planet = try JSONDecoder().decode(Planet.self, from: data!)
            completion?(planet, nil)
        }catch {
            completion?(nil, error.localizedDescription)
            print(error)
        }
    }
    
    
    task.resume()
}
