//
//  ClipAndMaskPage.swift
//  Example
//
//  Created by Tom on 17/6/2020.
//  Copyright © 2020 晋先森. All rights reserved.
//

import SwiftUI

//3种提供遮挡和裁剪的方法clipped/mask/clipShape

struct ClipAndMaskPage: View {
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Text(".clipped()")
                Rectangle()
                    .rotation(.degrees(45))
                    .fill(Color.red)
                    .clipped()//调用clipped()裁剪
                    .frame(width:100, height: 100)
            }
            
            HStack {
                Text(".mask(Rectangle())")
                Rectangle()
                    .rotation(.degrees(45))
                    .fill(Color.red)
                    .mask(Rectangle())//调用mask()裁剪
                    .frame(width:100, height: 100)
            }
            
            HStack {
                Text(".clipShape(Rectangle())")
                Rectangle()
                    .rotation(.degrees(45))
                    .fill(Color.red)
                    .clipShape(Rectangle())//调用clipShape()裁剪
                    .frame(width:100, height: 100)
            }
        }
    }
}

struct ClipAndMaskPage_Previews: PreviewProvider {
    static var previews: some View {
        ClipAndMaskPage()
    }
}
