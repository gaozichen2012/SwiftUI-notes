//
//  Home.swift
//  DesignCode2
//
//  Created by Tom on 15/1/2020.
//  Copyright © 2020 Tom. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var showProfile = false
    @State var viewState = CGSize.zero
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)//忽略安全区域
            
            HomeView(showProfile: $showProfile)
                .padding(.top,44)
                .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(radius: 20)
                .offset(y: showProfile ? -450 : 0)
                .rotation3DEffect(.degrees(showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10, y: 0, z: 0))
                .scaleEffect(showProfile ? 0.9 : 1)
                .animation(.easeInOut(duration: 0.2))
                .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .background(Color.black.opacity(0.001))//此背景目的是为了让下面的onTapGesture生效，opacity=0时点击不生效
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: viewState.height)
                .animation(.easeInOut(duration: 0.2))
                .onTapGesture {
                    self.showProfile.toggle()
            }
            .gesture(
                DragGesture().onChanged { value in //识别手势拖动的值，并将xy的值传给viewShow
                    self.viewState = value.translation
                }
                    .onEnded { value in //识别手势结束的状态，并将viewShow至0
                        if self.viewState.height > 50 {
                            self.showProfile = false
                        }
                        self.viewState = .zero
                }
            )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AvatarView: View {
    @Binding var showProfile: Bool
    var body: some View {
        Button(action: {self.showProfile.toggle()}) {
            Image("Avatar")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        }
    }
}

let screen = UIScreen.main.bounds //声明一个屏幕的常量，为了不同设备的自适应
