//
//  TabBar.swift
//  TomSwiftUITest
//
//  Created by Tom on 2/12/2019.
//  Copyright © 2019 Tom. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView() {
            Home().tabItem({
                VStack {
                    Image(systemName: "house")
                    Text("home")
                }
            })
                .tag(1) //constant(1)与.tag()相对应，constant选中那个，对应默认主界面就是tag()对应的界面
            ContentView().tabItem({
                VStack {
                    Image(systemName: "creditcard")
                    Text("Certificates")
                }
            })
                .tag(2)
            Settings().tabItem({
                VStack {
                    Image(systemName: "square.and.pencil")
                    Text("Settings")
                }
            })
                .tag(3)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
                .previewDevice("iPhone SE")
            TabBar()
                .previewDevice("iPhone Xr")
            TabBar()
                .previewDevice("iPad Pro (12.9-inch)")
                .environment(\.colorScheme, .dark)//以dark模式预览
//                .environment(\.sizeCategory, .extraExtraExtraLarge)//以指定字体大小预览
        }
    }
}
