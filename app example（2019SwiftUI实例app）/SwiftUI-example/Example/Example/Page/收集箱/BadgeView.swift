//
//  BadgeView.swift
//  Example
//
//  Created by Tom on 17/6/2020.
//  Copyright © 2020 晋先森. All rights reserved.
//

import SwiftUI

extension View {
    func badge(count: Int)->some View {
        overlay(
            ZStack {
                if count != 0 {
                    Circle()
                        .fill(Color.red)
                    Text("\(count)")
                        .foregroundColor(.white)
                        .font(.caption)
                }
            }
            .offset(x:12, y:-12)
            .frame(width:24, height:24)
            ,alignment: .topTrailing)
    }
}

struct BadgeView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        .padding(10)
            .background(Color.gray)
            .badge(count: 5)
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
