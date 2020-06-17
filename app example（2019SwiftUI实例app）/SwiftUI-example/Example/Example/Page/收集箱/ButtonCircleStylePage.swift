//
//  ButtonCircleStylePage.swift
//  Example
//
//  Created by Tom on 17/6/2020.
//  Copyright © 2020 晋先森. All rights reserved.
//

import SwiftUI

//1.在view上扩展一个背景圆的方法.tomBlueCircle()
//2.使用ViewModifier CircleModifier（不常用）
//3.为buttom添加风格使用ButtonStyle协议 CircleStyle()

struct CircleStyle: ButtonStyle {
    var foreground = Color.white
    var background = Color.blue
    
    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        Circle()
            .fill(background.opacity(configuration.isPressed ? 0.8 : 1))
            .overlay(Circle().strokeBorder(foreground).padding(3))
            .overlay(configuration.label.foregroundColor(foreground))
            .frame(width: 75, height: 75)
            .shadow(radius: 5)
    }
}

struct ButtonCircleStylePage: View {
    var body: some View {
        HStack {
            Button(action: {}, label: { Text("One")})
            Button(action: {}, label: { Text("Two")})
            Button(action: {}, label: { Text("Three")})
        }
        .buttonStyle(CircleStyle())
    }
}

struct ButtonCircleStylePage_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCircleStylePage()
    }
}
