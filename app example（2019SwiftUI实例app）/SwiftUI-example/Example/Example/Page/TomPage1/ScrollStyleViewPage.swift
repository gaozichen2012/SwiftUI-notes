//
//  ScrollViewPage.swift
//  Example
//
//  Created by Tom on 5/1/2020.
//  Copyright © 2020 晋先森. All rights reserved.
//

import SwiftUI

struct ScrollStyleViewPage: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 50) {
                    Text("SwiftUI").padding(20)
                    Divider()
                    Image(systemName: "cloud.sleet.fill")
                        .foregroundColor(.green)
                        .imageScale(.large)
                        .scaleEffect(2)
                        .shadow(radius: 5)
                    Divider()
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        Text("This is a default ScrollView\(item)")
                    }
                }
                .border(Color.gray.gradient, width: 1)
                .cornerRadius(10)
                .padding(10)
                .navigationBarTitle(Text("ScrollView"))
            }
            ScrollView (.horizontal,showsIndicators: true) {
                HStack(spacing: 30) {
                    Text("SwiftUI").padding(20)
                    Divider()
                    Image(systemName: "cloud.sleet.fill")
                        .foregroundColor(.green)
                        .imageScale(.large)
                        .scaleEffect(2)
                        .shadow(radius: 5)
                    Divider()
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        Text("This is a default ScrollView\(item)")
                    }
                }
                .border(Color.gray.gradient, width: 1)
                .cornerRadius(10)
                .padding(10)
                .navigationBarTitle(Text("ScrollView"))
            }
        }
    }
}

struct ScrollStyleViewPage_Previews: PreviewProvider {
    static var previews: some View {
        ScrollStyleViewPage()
    }
}
