//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Tom on 9/12/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarkData) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
        .navigationBarTitle(Text("Landmark"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
