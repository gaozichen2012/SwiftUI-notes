//
//  ContentView.swift
//  TodayInHistory
//
//  Created by Tom on 3/5/2020.
//  Copyright © 2020 Tom. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var fetcher = OnePocketAPI()
    var body: some View {
//        VStack {
//            List(fetcher.onePocket) { item in
//                HStack {
//                    Text(item.reason)
//                    Text("item.error_code:\(item.error_code)")
//                }
//            }
//        }
        HStack {
            Text(fetcher.onePocket!.reason)
            Text("item.error_code:\(fetcher.onePocket!.error_code)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
