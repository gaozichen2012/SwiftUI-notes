//
//  UpdateStore.swift
//  DesignCode2
//
//  Created by Tom on 17/1/2020.
//  Copyright © 2020 Tom. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates : [Update] = updateData
}
