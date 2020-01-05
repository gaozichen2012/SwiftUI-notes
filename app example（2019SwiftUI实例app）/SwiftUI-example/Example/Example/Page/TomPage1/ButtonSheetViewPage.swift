//
//  ButtonSheetViewPage.swift
//  Example
//
//  Created by Tom on 5/1/2020.
//  Copyright © 2020 晋先森. All rights reserved.
//

import SwiftUI

struct ButtonSheetViewPage: View {
    @State var show = false
    var body: some View {
        VStack {
            Button(action: { self.show.toggle() }){
                Text("点击跳出View（不带动画）")
                    .frame(width: 230, height: 44)
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 3)
            }
            .sheet(isPresented: self.$show) { ButtonSheetViewPage() }
        }
    }
}

struct ButtonSheetViewPage_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSheetViewPage()
    }
}
