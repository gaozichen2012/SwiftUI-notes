//
//  HomeView.swift
//  DesignCode2
//
//  Created by Tom on 16/1/2020.
//  Copyright © 2020 Tom. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile : Bool
    @State var showUpdate = false
    @Binding var showCentent: Bool
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    AvatarView(showProfile: $showProfile)
                    Button(action: { self.showUpdate.toggle() }) {
                        Image(systemName: "bell")
                            .renderingMode(.original)//默认黑色
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .clipShape(Circle())//切割图片切割成圆的
                            .shadow(radius: 10)
                    }
                    .sheet(isPresented: $showUpdate) {
                        UpdateList()
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    WatchRingsView()
                        .padding([.top, .leading, .bottom], 30.0)
                        .onTapGesture {
                            self.showCentent = true
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30.0) {
                        ForEach(sectionData) { item in
                            GeometryReader { geometry in //用GeometryReader实现3D滚动
                                SectionView(section: item)
                                    .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10.0, z: 0))
                            }
                            .frame(width:275, height: 275)
                        }
                    }
                    .padding(30.0)
                    .padding(.bottom,30)
                }
                
                HStack {
                    Text("Courses")
                        .font(.system(size: 28, weight: .bold))
                    Spacer()
                }
                .padding(.leading,30)
                
                CourseView()
//                SectionView(section: sectionData[1], width: screen.width-60, height: 275)
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showCentent: .constant(true))
    }
}

struct SectionView: View {
    var section: Section
    var width: CGFloat = 275
    var height: CGFloat = 275
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                Spacer()
                Image(section.logo)
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width:width, height: height)
        .background(section.color)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(title: "Learn SwiftUI for ios 13", text: "18节", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card1")), color: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))),//Image(uiImage: imageLiteral)//和color图形化界面类似显示，图片图形化预览
    Section(title: "Layout and Stacks", text: "18节", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card2")), color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))),
    Section(title: "Components and Visual Effects", text: "18节", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Background1")), color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))),
    Section(title: "Animations and States", text: "18节", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card6")), color: Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))),
    Section(title: "Gestures and Events", text: "18节", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card3")), color: Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))),
]


struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 50.0) {
            HStack(spacing: 12.0) {
                RingView(color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), width: 44, height: 44, percent: 56, show: .constant(true))
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 minutes left")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text("Watch 10 min today")
                        .font(.caption)
                }
            }
            .padding(8)
            .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .cornerRadius(20)
            .shadow(radius: 10)
            
            RingView(color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), width: 44, height: 44, percent: 34, show: .constant(true))
                .padding(8)
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .cornerRadius(20)
                .shadow(radius: 10)
            
            RingView(color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), width: 44, height: 44, percent: 80, show: .constant(true))
                .padding(8)
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .cornerRadius(20)
                .shadow(radius: 10)
        }
    }
}
