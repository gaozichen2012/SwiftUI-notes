//
//  CircleBackgrandPage.swift
//  Example
//
//  Created by Tom on 16/6/2020.
//  Copyright © 2020 晋先森. All rights reserved.
//

import SwiftUI

//在view上扩展一个背景圆的方法
extension View {
    func tomBlueCircle(foreground: Color = .white, background: Color = .blue) -> some View {
        Circle()
            .fill(background)
            //            .overlay(Circle().strokeBorder(foreground).padding(3))
            .overlay(self.foregroundColor(foreground))
            .frame(width: 30, height: 30)
            .shadow(radius: 10)
    }
}

struct CircleModifier: ViewModifier {
    var foreground = Color.white
    var background = Color.blue
    func body(content: Content) -> some View {
        Circle()
            .fill(background)
//            .overlay(Circle().strokeBorder(foreground).padding(3))
            .overlay(content.foregroundColor(foreground))
            .frame(width: 30, height: 30)
            .shadow(radius: 10)
    }
}

struct CircleBackgrandPage: View {
    var body: some View {
        
        VStack(alignment: .trailing) {
            //使用自定义背景插件.tomBlueCircle()
            HStack {
                Text(".tomBlueCircle()（常用）")
                Text("按")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .shadow(radius: 5)
                    .tomBlueCircle()
                Image(systemName: "plus")
                    .shadow(radius: 5)
                    .tomBlueCircle()
            }
            
            //使用自定义的ViewModifier CircleModifier（不常用）
            HStack {
                Text(".modifier(CircleModifier())（不常用）")
                Text("按")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .shadow(radius: 5)
                    .modifier(CircleModifier())
                Image(systemName: "plus")
                    .shadow(radius: 5)
                    .modifier(CircleModifier())
            }
        }
        

    }
}

struct CircleBackgrandPage_Previews: PreviewProvider {
    static var previews: some View {
        CircleBackgrandPage()
    }
}
