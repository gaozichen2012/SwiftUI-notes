//
//  RingView.swift
//  DesignCode2
//
//  Created by Tom on 20/1/2020.
//  Copyright © 2020 Tom. All rights reserved.
//

import SwiftUI

struct RingView: View {
    var color = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    var width:CGFloat = 300//不定义为CGFloat会初始化为int从而导致设置frame时出错
    var height:CGFloat = 300
    var percent:CGFloat = 44
    @Binding var show: Bool
    
    var body: some View {
        let multiplier = width / 44 //此值是为了根据圆环大小自动适配不同的圆环宽度
        let progress = 1-(percent / 100)
        
        return ZStack {
            Circle()
                .stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)
            
            Circle()//画一个圆
                .trim(from: show ? progress : 1, to: 1)//设置圆的起始点，0.1表示从10%开始到(1)100%
                .stroke(Color(color), style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 0))//设置圆的样式
                .rotationEffect(.degrees(90))//通过rotationEffect和3D旋转或反转得到想要的样式
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(radius: 3 * multiplier)
                
            
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
                .onTapGesture {
                    self.show.toggle()
            }
            
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))//对于binding的值设置初始值
    }
}
