//
//  UpdateList.swift
//  TomSwiftUITest
//
//  Created by Tom on 1/12/2019.
//  Copyright © 2019 Tom. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    var updates = updateData
    @ObservedObject var store = UpdateStore() //声明一个可操作的数据store
    @State var showSettings = false
    
    func addUpdate() {
        store.updates.append(Update(image: "Certificate1", title: "New Title", text: "New Text", date: "JUL 1"))
    }
    
    //获取移动list的值供onMove调用
    func move(from source: IndexSet, to destination: Int) {
        store.updates.swapAt(source.first!, destination)
    }
    
    var body: some View {
        /* 导航列表视图使用NavigationView-NavigationLink通用框架 */
        NavigationView {
            List {
                ForEach(store.updates) { item in //创建foreach是为了增加滑动删除按钮
                    NavigationLink(destination: UpdateDetail(title: item.title, text: item.text, image: item.image)) {
                        HStack(spacing: 15.0) {
                            Image(item.image)
                                .resizable()//图片设置步骤1:让图像尺寸可调
                                .aspectRatio(contentMode: .fit)//图片设置步骤2:将图片设置为填充
                                .frame(width: 80 ,height: 80)//图片设置步骤3:设置图片框架大小
                                .background(Color("background"))
                                .cornerRadius(20)
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text(item.text)
                                    .lineLimit(2)
                                    .lineSpacing(4)
                                    .font(.subheadline)
                                    .frame(height: 50)
                                Text(item.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                    .padding(.vertical)
                }
                    
                .onDelete{ index in
                self.store.updates.remove(at: index.first!)
                }//onDelete为删除控件，当左滑动作出现时，删除updates数据
                .onMove(perform: move)
            }
            .navigationBarTitle(Text("Updates"))
            //在导航列表界面创建按钮功能需要使用navigationBarItems
            //如果是编辑按钮直接调用EditButton()
            //如果是添加选项则使用Button模型即可
            //如果是需要调出新页面则需要使用Button-sheet模型
            .navigationBarItems(
                leading: Button(action: addUpdate) { Text("Add Update") },
                trailing: EditButton()
                
//Updates页面右上角设置按钮，暂时屏蔽
//                Button(action: { self.showSettings.toggle() }) {
//                    Image(systemName: "gear")
//                        .sheet(isPresented: self.$showSettings) {
//                            Text("Settings")
//                    }
//                }
            )
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Illustration1", title: "SwiftUI", text: "Learn how to build custom views and controls in SwiftUI with advanced composition, layout, graphics, and animation. See a demo of a high performance, animatable control and watch it made step by step in code. Gain a deeper understanding of the layout system of SwiftUI.", date: "JUN 26"),
    Update(image: "Illustration2", title: "Framer X", text: "Learn how to build custom views and controls in SwiftUI with advanced composition, layout, graphics, and animation. See a demo of a high performance, animatable control and watch it made step by step in code. Gain a deeper understanding of the layout system of SwiftUI.", date: "JUN 11"),
    Update(image: "Illustration3", title: "CSS Layout", text: "Learn how to combine CSS Grid, Flexbox, animations and responsive design to create a beautiful prototype in CodePen.", date: "MAY 26"),
    Update(image: "Illustration4", title: "React Native Part 2", text: "Learn how to implement gestures, Lottie animations and Firebase login.", date: "MAY 15"),
    Update(image: "Certificate1", title: "Unity", text: "Unity course teaching basics, C#, assets, level design and gameplay", date: "MAR 19"),
    Update(image: "Certificate2", title: "React Native for Designers", text: "Build your own iOS and Android app with custom animations, Redux and API data.", date: "FEB 14"),
    Update(image: "Certificate3", title: "Vue.js", text: "Make a dashboard web-app with a complete login system, dark mode, and animated charts for your data.", date: "JAN 23")
]
