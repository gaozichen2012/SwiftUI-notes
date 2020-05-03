import Foundation

public class UserAPI:ObservableObject {
    let endpoint = "http://tomtwos.com/json_users.php"
    @Published var users = [User]()
    
    init(){
        getUsers()
    }
    
    public func getUsers() {
        Networking.fetch(fromEndpoint: endpoint) { (result) in
            switch result {
            case .success(let data):
                guard let data = data else {
                    return
                }
                do {
                        self.users = try JSONConverter.decode(data)!
                    //print(self.users)
                } catch {
                    print("Decoding error: \(error.localizedDescription)")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
