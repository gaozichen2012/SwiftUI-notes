import Foundation

import Foundation
public enum NetworkingError: Error {
    case unableToGenerateURL
}
public class Networking {
    public static func fetch(fromEndpoint endpoint: String, completionHandler: @escaping ((Result<Data?, Error>) -> Void)) {
        guard let url = URL(string: endpoint) else {
            let error = NetworkingError.unableToGenerateURL
            completionHandler(Result.failure(error))
            return
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                completionHandler(Result.failure(error!))
                return
            }
            completionHandler(Result.success((data)))
        }
        task.resume()
    }
    
    public static func post(toEndpoint endpoint: String, data: Data, completionHandler: @escaping ((Result<Int, Error>) -> Void)) {
        guard let url = URL(string: endpoint) else {
            print("Unable to generate url")
            return
        }
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"//httpMethod请求的默认设置为GET，将其更改为PUT
        request.httpBody = data //将上传的数据data添加到请求的对象中httpBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")//将“application / json”的“ Content-Type”添加到请求的HTTP标头中。
        
        //dataTask创建任务并返回处理结果
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completionHandler(Result.failure(error!))
                return
            }
            completionHandler(Result.success((response as!    HTTPURLResponse).statusCode))
        }
        task.resume()//调用task的resume方法发送数据
    }
}
