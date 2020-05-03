import Foundation

//创建一个struct结构体userAPI，链接我们实际的服务器url地址
public struct UserAPI {
    static let endpoint = "https://jsonplaceholder.typicode.com/users"
    
    //创建一个getUsers的方法，调用我们的Networking.fetch，通过result响应
    public static func getUsers(completionHandler: @escaping (Result<[User]?, Error>) -> Void) {
        Networking.fetch(fromEndpoint: endpoint) { (result) in
            switch result {
            case .success(let data):
                //如果result成功，用do/catch模块解码数据，解码成功后将数据传给users
                guard let data = data else {
                    //completionHandler(.success(nil))表示没有返回数据，将返回一个成功的nil，因为只是服务器没有发送数据，但是调用是成功的
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
            //使用JSONConverter.encode将数据编码为json
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
