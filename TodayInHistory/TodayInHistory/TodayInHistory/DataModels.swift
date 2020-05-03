//
//  DataModels.swift
//  TodayInHistory
//
//  Created by Tom on 3/5/2020.
//  Copyright © 2020 Tom. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

public struct HistoryPocket: Codable, Identifiable {
    public var id: Int
//    public var result = [HistoryEvent]()
//    public var result: HistoryEvent
    public var reason: String
    public var error_code: Int
}

public struct HistoryEvent: Codable {
    public var id: String
    public var title: String
    public var pic: String
    public var year: Int
    public var month: Int
    public var des: String
    public var lunar: String
}

//struct Holiday: Decodable, Identifiable {
//    public var id: String
//    public var year: String
//    public var month: String
//    public var day: String
//    public var description: String
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case year = "year"
//        case month = "month"
//        case day = "day"
//        case description = "description"
//    }
//}
