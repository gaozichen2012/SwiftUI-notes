//
//  TabBarStyleViewPage.swift
//  Example
//
//  Created by Tom on 1/1/2020.
//  Copyright © 2020 晋先森. All rights reserved.
//

import SwiftUI

//func buttonStyle<S>(S) -> View
//Sets the style for buttons within this view.
//
//func buttonStyle<S>(S) -> View
//Sets the style for buttons within this view.
//
//func menuButtonStyle<S>(S) -> View
//Sets the style for menu buttons within this view.
//
//func pickerStyle<S>(S) -> View
//Sets the style for pickers within this view.
//
//func datePickerStyle<S>(S) -> View
//Sets the style for date pickers within this view.
//
//func textFieldStyle<S>(S) -> View
//Sets the style for text fields within this view.
//
//func toggleStyle<S>(S) -> View
//Sets the style for toggles within this view.
//
//func listStyle<S>(S) -> View
//Sets the style for lists within this view.
//
//func navigationViewStyle<S>(S) -> View
//Sets the style for navigation views within this view.

struct TabBarStyleViewPage: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.red
    }
    var body: some View {
        
        VStack {
            Text("List两种形式：plain和grouped，默认是plain样式。设置grouped样式.listStyle(GroupedListStyle())")
            Text(" ")
            Text("测试从外部标题点进ListStyleViewPage，两种样式是相同的，但在电脑预览样式，两种样式是有区别的")
            TabView() {
                SFSymbolsViewPage().tabItem({
                    VStack {
                        Image(systemName: "house")
                        Text("home")
                    }
                })
                    .tag(1) //constant(1)与.tag()相对应，constant选中那个，对应默认主界面就是tag()对应的界面
                SFSymbolsViewPage().tabItem({
                    VStack {
                        Image(systemName: "creditcard")
                        Text("Certificates")
                    }
                })
                    .tag(2)
                SFSymbolsViewPage().tabItem({
                    VStack {
                        Image(systemName: "square.and.pencil")
                        Text("Updates")
                    }
                })
                    .tag(3)
            }
            .accentColor(.orange)
            TabView() {
                SFSymbolsViewPage().tabItem({
                    VStack {
                        Image(systemName: "house")
                        Text("home")
                    }
                })
                    .tag(1) //constant(1)与.tag()相对应，constant选中那个，对应默认主界面就是tag()对应的界面
                SFSymbolsViewPage().tabItem({
                    VStack {
                        Image(systemName: "creditcard")
                        Text("Certificates")
                    }
                })
                    .tag(2)
                SFSymbolsViewPage().tabItem({
                    VStack {
                        Image(systemName: "square.and.pencil")
                        Text("Updates")
                    }
                })
                    .tag(3)
            }
            TabView() {
                SFSymbolsViewPage().tabItem({
                    VStack {
                        Image(systemName: "house")
                        Text("home")
                    }
                })
                    .tag(1) //constant(1)与.tag()相对应，constant选中那个，对应默认主界面就是tag()对应的界面
                SFSymbolsViewPage().tabItem({
                    VStack {
                        Image(systemName: "creditcard")
                        Text("Certificates")
                    }
                })
                    .tag(2)
                SFSymbolsViewPage().tabItem({
                    VStack {
                        Image(systemName: "square.and.pencil")
                        Text("Updates")
                    }
                })
                    .tag(3)
            }
        }
    }
}

struct TabBarStyleViewPage_Previews: PreviewProvider {
    static var previews: some View {
        TabBarStyleViewPage()
    }
}
