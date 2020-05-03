//
//  UserAPI.swift
//  TodayInHistory
//
//  Created by Tom on 3/5/2020.
//  Copyright © 2020 Tom. All rights reserved.
//

import Foundation

//创建一个struct结构体userAPI，链接我们实际的服务器url地址
public class OnePocketAPI: ObservableObject {
    @Published var onePocket : HistoryPocket?
    
    let endpoint = "http://api.juheapi.com/japi/toh?v=&month=&day=&key=f16083ccb0da9bce187582cab895c060"
    
    init() {
        load()
    }
    
    func load() {
        let url = URL(string: endpoint)!
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode(HistoryPocket.self, from: d)
                    self.onePocket = decodedLists
                    print("tom Data")
                }else {
                    print("No Data")
                }
            } catch {
                print ("Error")
            }
        }.resume()
    }
    
//    //创建一个getUsers的方法，调用我们的Networking.fetch，通过result响应
//    public func getOnePocket(completionHandler: @escaping (Result<[HistoryPocket]?, Error>) -> Void) {
//        Networking.fetch(fromEndpoint: endpoint) { (result) in
//            switch result {
//            case .success(let data):
//                //如果result成功，用do/catch模块解码数据，解码成功后将数据传给users
//                guard let data = data else {
//                    //completionHandler(.success(nil))表示没有返回数据，将返回一个成功的nil，因为只是服务器没有发送数据，但是调用是成功的
//                    completionHandler(.success(nil))
//                    return
//                }
//                do {
//                    let onePocket: [HistoryPocket]? = try JSONConverter.decode(data)
//                    completionHandler(.success(onePocket))
//                } catch {
//                    print("Decoding error: \(error.localizedDescription)")
//                }
//            case .failure(let error):
//                completionHandler(.failure(error))
//            }
//        }
//    }
    
//    public static func saveUser(_ user: User) {
//        do {
//            //使用JSONConverter.encode将数据编码为json
//            guard let data = try JSONConverter.encode(user) else {
//                return
//            }
//            let serialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//            print(serialized?.description ?? "<no serialized description>")
//
//            /* post start */
//            //在post endpoint过程中附加user id，是为了方便服务器知道我们正在修改哪个用户
//            Networking.post(toEndpoint: "\(endpoint)/\(user.id)", data: data) { (result) in
//                switch result {
//                case .success(let statusCode):
//                    print("Saved with code \(statusCode)")
//                case .failure(let error):
//                    print("Unable to save: \(error.localizedDescription)")
//                }
//            }
//            /* post end */
//
//        } catch {
//            print("Encoding error: \(error.localizedDescription)")
//        }
//    }
}
