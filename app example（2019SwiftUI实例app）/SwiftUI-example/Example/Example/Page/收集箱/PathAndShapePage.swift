//
//  PathAndShapePage.swift
//  Example
//
//  Created by Tom on 17/6/2020.
//  Copyright © 2020 晋先森. All rights reserved.
//

import SwiftUI

//自定义的三角形(用到了Path & Shape)
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {p in
            p.move(to: CGPoint(x:rect.midX, y:rect.minY))
            p.addLines([
                CGPoint(x: rect.maxX, y: rect.maxY),
                CGPoint(x: rect.minX, y: rect.maxY),
                CGPoint(x: rect.midX, y: rect.minY)
            ])
        }
    }
}

struct PathAndShapePage: View {
    var body: some View {
        VStack(spacing: 30.0) {
            //自定义的三角形
            HStack(spacing: 30.0) {
                Text("Triangle()")
                Triangle()
                    .fill(Color.red)
                    .border(Color.blue)
                    .frame(width:100,height: 100)
            }
            
            //系统定义的正方形
            HStack(spacing: 30.0) {
                Text("Rectangle()")
                Rectangle()
                    .rotation(.degrees(45))
                    .fill(Color.red)
                    .border(Color.blue)
                    .frame(width:100,height: 100)
            }
        }
    }
}

struct PathAndShapePage_Previews: PreviewProvider {
    static var previews: some View {
        PathAndShapePage()
    }
}
