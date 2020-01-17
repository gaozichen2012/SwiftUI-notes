//
//  UpdateDetail.swift
//  DesignCode2
//
//  Created by Tom on 17/1/2020.
//  Copyright © 2020 Tom. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    var update: Update = updateData[1]
    var body: some View {
        List {
            VStack {
                update.image
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationBarTitle(update.title)//为了在详细界面内显示列表的标题
        }
    .listStyle(GroupedListStyle())//默认list无背景，GroupedListStyle背景为白色
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
