//
//  UserData.swift
//  Landmarks
//
//  Created by Tom on 9/12/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
