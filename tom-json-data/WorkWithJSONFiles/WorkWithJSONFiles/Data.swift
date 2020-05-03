//
//  Data.swift
//  WorkWithJSONFiles
//
//  Created by Tom on 3/5/2020.
//  Copyright © 2020 Tom. All rights reserved.
//

import SwiftUI

//let landmarkData: [Landmark] = load("landmarkData.json")
public let pocketData: Pocket = load("pocket_error.json")

public struct Pocket: Hashable, Codable, Identifiable {
    public var id: Int
    public var reason: String
    public var error_code: Int
}

func load<T: Codable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

//struct Landmark: Hashable, Codable, Identifiable {
//    var id: Int
//    var name: String
//    fileprivate var imageName: String
//    fileprivate var coordinates: Coordinates
//    var state: String
//    var park: String
//    var category: Category
//
//    var locationCoordinate: CLLocationCoordinate2D {
//        CLLocationCoordinate2D(
//            latitude: coordinates.latitude,
//            longitude: coordinates.longitude)
//    }
//
//    enum Category: String, CaseIterable, Codable, Hashable {
//        case featured = "Featured"
//        case lakes = "Lakes"
//        case rivers = "Rivers"
//    }
//}

//extension Landmark {
//    var image: Image {
//        ImageStore.shared.image(name: imageName)
//    }
//}
