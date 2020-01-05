//
//  SwiftUIView.swift
//  Example
//
//  Created by Tom on 5/1/2020.
//  Copyright © 2020 晋先森. All rights reserved.
//

import SwiftUI

struct ButtonAnimationViewPage: View {
    @State var show1 = false
    @State var show2 = false
    var body: some View {
        VStack(spacing: 100.0) {
            ButtonSheetViewPage(show:show1)
            Button(action: { withAnimation {self.show2.toggle()}}) {
                Text("点击跳出View（带动画）")
                    .frame(width: 230, height: 44)
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 3)
                    
                    .rotationEffect(.degrees(show2 ? 90 : 0))
                    .scaleEffect(show2 ? 1.5 : 1)
                    .animation(.default)
            }
            .sheet(isPresented: self.$show2) { ButtonAnimationViewPage()}
        }
    }
}

struct ButtonAnimationViewPage_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAnimationViewPage()
    }
}
