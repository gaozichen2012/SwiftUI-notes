//
//  UpdateDetail.swift
//  TomSwiftUITest
//
//  Created by Tom on 1/12/2019.
//  Copyright © 2019 Tom. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    var title = "1"
    var text = "2"
    var image = "Illustration1"
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            Text(text)
                .lineLimit(nil)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)//给文本设置框架时经常遇到不生效或者不理想的状态，使用以下方式即可解决：设置为最大边框，再左对齐
            Spacer()
        }
        .padding(30)
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
