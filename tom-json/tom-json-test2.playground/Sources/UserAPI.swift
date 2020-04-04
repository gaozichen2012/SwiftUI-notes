import Foundation

public struct UserAPI {
    static let endpoint = "https://jsonplaceholder.typicode.com/users"
    
    public static func getUsers(completionHandler: @escaping (Result<[User]?, Error>) -> Void) {
        Networking.fetch(fromEndpoint: endpoint) { (result) in
            switch result {
            case .success(let data):
                guard let data = data else {
                    completionHandler(.success(nil))
                    return
                }
                do {
                    let users: [User]? = try JSONConverter.decode(data)
                    completionHandler(.success(users))
                } catch {
                    print("Decoding error: \(error.localizedDescription)")
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public static func saveUser(_ user: User) {
        do {
            guard let data = try JSONConverter.encode(user) else {
                return
            }
            let serialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            print(serialized?.description ?? "<no serialized description>")
            
            /* post start */
            //在post endpoint过程中附加user id，是为了方便服务器知道我们正在修改哪个用户
            Networking.post(toEndpoint: "\(endpoint)/\(user.id)", data: data) { (result) in
                switch result {
                case .success(let statusCode):
                    print("Saved with code \(statusCode)")
                case .failure(let error):
                    print("Unable to save: \(error.localizedDescription)")
                }
            }
            /* post end */
            
        } catch {
            print("Encoding error: \(error.localizedDescription)")
        }
    }
}
