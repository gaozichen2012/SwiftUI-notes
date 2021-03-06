//
//  ContentView.swift
//  TomSwiftUITest
//
//  Created by Tom on 24/11/2019.
//  Copyright © 2019 Tom. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    var body: some View {
        ZStack {
//            BlurView(style: .extraLight)
            BlurView(style: .systemMaterial)//模糊视图的背景选为系统材料，为了用于兼容dark模式
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            CardBottonView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardView()
                .background(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
//                .rotation3DEffect(Angle(degrees: show ? 50 : 0), axis: /*@START_MENU_TOKEN@*/(x: 10.0, y: 10.0, z: 10.0)/*@END_MENU_TOKEN@*/)
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
                .offset(x: viewState.width, y: viewState.height)
            CardView()
                .background(show ? Color.red : Color.yellow)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
//                .rotation3DEffect(Angle(degrees: show ? 40 : 0), axis: /*@START_MENU_TOKEN@*/(x: 10.0, y: 10.0, z: 10.0)/*@END_MENU_TOKEN@*/)
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
                .offset(x: viewState.width, y: viewState.height)
            CertificateView()
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
//                .rotation3DEffect(Angle(degrees: show ? 30 : 0), axis: /*@START_MENU_TOKEN@*/(x: 10.0, y: 10.0, z: 10.0)/*@END_MENU_TOKEN@*/)
                .animation(.spring())
                .onTapGesture {
                    self.show.toggle()
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.viewState = value.translation
                        self.show = true
                }
                .onEnded {value in
                    self.viewState = CGSize.zero
                    self.show = false
                }
            )
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            Text("card back")
        }
        .frame(width: 340, height: 220.0)
        
    }
}

struct CertificateView: View {
    var item = Certificate(title: "UI", image: "Certificate1", width: 340, height: 220)
    var body: some View {
        VStack {
            HStack {
                VStack {
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.headline).fontWeight(.medium).foregroundColor(Color.green).padding(.top)
                        Text("Tom")
                            .foregroundColor(Color.white)
                    }
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
            }
            .padding(.horizontal)
            Spacer()
            Image(item.image)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .offset(y: 50)
        }
        .frame(width: CGFloat(item.width), height: CGFloat(item.height))
        .background(Color.black)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Tom")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Image("Illustration5")
            Spacer()
        }.padding()
    }
}

struct CardBottonView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                .opacity(0.1)
            Text("This is tom test ui design,and this is a long long long long long text")
                .lineLimit(5)
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
//        .background(Color.white)
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(30)
        .shadow(radius: 20)
            .offset(y: UIScreen.main.bounds.height-170)
    }
}
