//
//  MenuView.swift
//  DesignCode2
//
//  Created by Tom on 15/1/2020.
//  Copyright © 2020 Tom. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16.0) {
                Text("Tom -28% complete")
                .font(.caption)
                
                Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)) //Color可以作为框架直接使用
                    .frame(width: 38, height: 6)
                    .cornerRadius(3)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08))
                    .padding()
                    .frame(width: 150, height: 24)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.1))
                    .cornerRadius(12)
                MenuRow(title: "账号", icon: "gear")
                MenuRow(title: "账单", icon: "creditcard")
                MenuRow(title: "退出", icon: "person.crop.circle")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]), startPoint: .top, endPoint: .bottom))//渐变色LinearGradient和颜色图形化代码colorLiteral,双击切换颜色
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(radius: 30)
            .padding(.horizontal, 30.0)
            .overlay(
                Image("Avatar")
                .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                .clipShape(Circle())
                    .offset(y: -150)
            )
        }
        .padding(.bottom, 30.0)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    var title: String
    var icon: String
    
    var body: some View {
        HStack(spacing: 16.0) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: 120, alignment: .leading)
        }
    }
}
