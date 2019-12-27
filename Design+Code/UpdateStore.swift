//
//  UpdateStore.swift
//  TomSwiftUITest
//
//  Created by Tom on 1/12/2019.
//  Copyright © 2019 Tom. All rights reserved.
//

import SwiftUI
import Combine  //结合，Combine允许我们创建储存数据，并且进行数据操作的框架


//下面程序的意思是当更新updates会储存
//调用UpdateStore这个class就可以更新并储存updates
class UpdateStore : ObservableObject {
    @Published var updates: [Update] = updateData //定义一个updates初始值为updateData
}


