//
//  TabBar.swift
//  DesignCode2
//
//  Created by Tom on 20/1/2020.
//  Copyright © 2020 Tom. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            ContentView().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Certificates")
            }
            CourseList().tabItem {
                Image(systemName: "play")
                Text("Course List")
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        //多个预览用Group
        Group {
            TabBar().previewDevice("iPhone 8")
            //            TabBar().previewDevice("iPhone X")
        }
    }
}
