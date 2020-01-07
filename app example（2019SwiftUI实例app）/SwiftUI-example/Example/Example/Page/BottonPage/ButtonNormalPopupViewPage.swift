//
//  ButtonNormalPopupViewPage.swift
//  Example
//
//  Created by Tom on 7/1/2020.
//  Copyright © 2020 晋先森. All rights reserved.
//

import SwiftUI

//父视图
struct ButtonNormalPopupViewPage: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            NormalButtonSonView(show: $show)
            .animation(.spring())
            PopupSonView(show: $show)
            .animation(.easeInOut(duration: 2))
        }
    }
}

struct ButtonNormalPopupViewPage_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNormalPopupViewPage()
    }
}

//Button子视图
struct NormalButtonSonView: View {
    @Binding var show : Bool
    var body: some View {
        Button(action: { self.show.toggle()}) {
            VStack {
                BottonView()
                .scaleEffect(show ? 1.5 : 1)
                Spacer()
            }
        }
    }
}

//弹出的子视图
struct PopupSonView: View {
    @Binding var show : Bool
    var body: some View {
        VStack {
            Text("这是一个点击按钮弹出的子视图")
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.yellow)
        .cornerRadius(30)
        .offset(y:show ? 50 : UIScreen.main.bounds.height)
        .onTapGesture {
            self.show.toggle()
        }
    }
}

//定义一个按钮
struct BottonView: View {
    var body: some View {
        VStack {
            Text(" 弹出普通视图 ")
        }
        .frame(width:150,height: 50)
        .background(Color.pink)
        .foregroundColor(.white)
        .cornerRadius(30)
    }
}
