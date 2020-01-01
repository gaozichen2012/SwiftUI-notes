//
//  ListStyleViewPage.swift
//  Example
//
//  Created by Tom on 1/1/2020.
//  Copyright © 2020 晋先森. All rights reserved.
//

import SwiftUI

struct ListStyleViewPage: View {
    var body: some View {
        VStack {
            Text("List两种形式：plain和grouped，默认是plain样式。设置grouped样式.listStyle(GroupedListStyle())")
            Text(" ")
            Text("测试从外部标题点进ListStyleViewPage，两种样式是相同的，但在电脑预览样式，两种样式是有区别的")
            NavigationView {
                List {
                    Section(header:Text("Sectiont页头部分"), footer: Text("Section页脚部分"))
                    {
                        ForEach(0 ..< 3) { item in
                            Text("Hello World \(item)")
                        }
                    }
                    
                }
                .navigationBarTitle(Text("List1-plain默认样式"))
            }
            NavigationView {
                List {
                    Section(header:Text("Sectiont页头部分"), footer: Text("Section页脚部分"))
                    {
                        ForEach(0 ..< 3) { item in
                            Text("Hello World \(item)")
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle(Text("List2-grouped样式"))
            }
        }
    }
}

struct ListStyleViewPage_Previews: PreviewProvider {
    static var previews: some View {
        ListStyleViewPage()
    }
}
