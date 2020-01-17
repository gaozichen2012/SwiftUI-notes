//
//  UpdateList.swift
//  DesignCode2
//
//  Created by Tom on 17/1/2020.
//  Copyright © 2020 Tom. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    
    //通用定义：addUpdate实现添加项目，配合navigationBarItems+button，在列表中显示一个加号
    func addUpdate() {
        store.updates.append(Update(image: Image(uiImage: #imageLiteral(resourceName: "Card1")), title: "New item", text: "New text", date: "New date"))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetail(update: update)) {
                        HStack {
                            update.image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color.black)
                                .cornerRadius(20)
                                .padding(.trailing, 4)
                            
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))
                                Text(update.text)
                                    .lineLimit(2)//最多2行，多的省略号隐藏
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onMove { (source: IndexSet, destination: Int) in
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                }
                .onDelete { index in
                    self.store.updates.remove(at: index.first!)
                }
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(leading: Button(action: addUpdate) {
                Text("Add Update")
            },trailing: EditButton())//显示增加按钮和编辑按钮
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
    var image: Image
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: Image(uiImage: #imageLiteral(resourceName: "Card1")), title: "SwiftUI Advanced", text: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.", date: "JAN 1"),
    Update(image: Image(uiImage: #imageLiteral(resourceName: "Card2")), title: "Webflow", text: "Design and animate a high converting landing page with advanced interactions, payments and CMS", date: "OCT 17"),
    Update(image: Image(uiImage: #imageLiteral(resourceName: "Card3")), title: "ProtoPie", text: "Quickly prototype advanced animations and interactions for mobile and Web.", date: "AUG 27"),
    Update(image: Image(uiImage: #imageLiteral(resourceName: "Card4")), title: "SwiftUI", text: "Learn how to code custom UIs, animations, gestures and components in Xcode 11", date: "JUNE 26"),
    Update(image: Image(uiImage: #imageLiteral(resourceName: "Card5")), title: "Framer Playground", text: "Create powerful animations and interactions with the Framer X code editor", date: "JUN 11")
]
