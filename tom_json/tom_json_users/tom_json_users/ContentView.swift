//
//  ContentView.swift
//  tom_json_users
//
//  Created by Tom on 26/4/2020.
//  Copyright © 2020 Tom. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

struct ContentView: View {
    @ObservedObject var fetcher = UserAPI()
    
    var body: some View {
        VStack {
            List(fetcher.users) { user in
                HStack {
                    Text("first")
                    Text(user.name)
                    Text(user.psd)
                    Text(user.tel)
                        .font(.system(size: 20))
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
