//
//  HomeList.swift
//  TomSwiftUITest
//
//  Created by Tom on 30/11/2019.
//  Copyright © 2019 Tom. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    @State var showContent = false
    var courses = courseData
    var body: some View {
        /* ScrollView中horizontal是让view水平滚动，showsIndicators=false是为了不现实滚动条 */
        ScrollView (.horizontal,showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(courses) { item in
                    Button(action: { self.showContent.toggle() }){
                        CourceView(
                            titile: item.title,
                            image: item.image,
                            color: item.color,
                            shadowColor: item.shadowColor)
                    }
                    .sheet(isPresented: self.$showContent) { ContentView() }//Button-sheet组合使用，实现点击按钮跳出指定View
                }
                .padding(.leading, 30)
                .padding(.trailing,30)
            }
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourceView: View {
    var titile = "Bluid an app on SwiftUI"
    var image = "Illustration1"
    var color = Color("background3")
    var shadowColor = Color("backgroundShadow3")
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(titile)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(20)
                .lineLimit(4)
                .padding(.trailing, 50)
            Spacer()
            Image(image)
                .resizable()
                .renderingMode(.original)//不加此句CourceView渲染会异常
                .aspectRatio(contentMode: .fit)//同比例放大
                .padding(.bottom, 30)//从底部开始向上填充30
                .frame(width: 246, height: 150)
        }
        .background(color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}

struct Course : Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
    
}

let courseData = [
    Course(
        title: "Build an app on SwiftUI",
        image: "Illustration1",
        color: Color("background3"),
        shadowColor: Color("backgroundShadow3")
    ),
    Course(
        title: "Design Courcse",
        image: "Illustration2",
        color: Color("background4"),
        shadowColor: Color("backgroundShadow4")
    )
    
]
