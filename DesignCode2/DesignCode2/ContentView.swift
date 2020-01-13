//
//  ContentView.swift
//  DesignCode2
//
//  Created by Tom on 8/1/2020.
//  Copyright © 2020 Tom. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewShow = CGSize.zero
    @State var showCard = false
    @State var ButtonState = CGSize.zero
    @State var showFull = false
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(//多重动画在.animation中再调用Animation
                    Animation
                        .default
                        .delay(0.2)
                    //                        .speed(2)
                    //                    .repeatCount(3)//让动画重复几次
            )
            BackCardView()
                .frame(width: showCard ? 300 : 340.0, height: 220.0)
                .background(Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewShow.width, y: viewShow.height)
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(showCard ? -10 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 10), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.default)
            BackCardView()
                .frame(width: 340.0, height: 220.0)
                .background(Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewShow.width, y: viewShow.height)
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(.degrees(showCard ? -5 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 5), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.default)
            CardView()
                .frame(width: showCard ? 375 : 340.0, height: 220.0)
                .background(Color.black)
                //                .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))//代替cornerRadius，让corner也能有动画
                .shadow(radius: 20)
                .offset(x: viewShow.width, y: viewShow.height)
                .offset(y: showCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.2))
                .onTapGesture {//识别点击,并将值传给show
                    self.showCard.toggle()
            }
            .gesture(
                DragGesture().onChanged { value in //识别手势拖动的值，并将xy的值传给viewShow
                    self.viewShow = value.translation
                    self.show = true //拖动时同时触发点击动画
                }
                    .onEnded { value in //识别手势结束的状态，并将viewShow至0
                        self.viewShow = .zero
                        self.show = false
                }
            )
            Text("\(ButtonState.height)").offset(y: -300)
            ButtonCardView()
                .offset(x: 0, y: showCard ? 300 : 1000)
                .offset( y: ButtonState.height)
                .blur(radius: show ? 20 : 0)
                .animation(.easeInOut)
                .gesture(
                    DragGesture().onChanged { value in //识别手势拖动的值，并将xy的值传给viewShow
                        self.ButtonState = value.translation
                        if self.showFull {
                            self.ButtonState.height += -300
                        }
                    }
                        .onEnded { value in //识别手势结束的状态，并将viewShow至0
                            if self.ButtonState.height > 50 {
                                self.showCard = false
                            }
                            if self.ButtonState.height < -100 && !self.showFull {
                                self.ButtonState.height = -300
                                self.showFull = true
                            } else {
                                self.ButtonState = .zero
                                self.showFull = false
                            }
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
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("certificate")
                        .foregroundColor(Color("accent"))
                    
                }
                Spacer()
                Image("Logo1")
            }
            .padding(.horizontal,20)
            .padding(.top,20)
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:300, height: 110, alignment: .top)
        }
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(.leading)
            Image("Background1")
            Spacer()
        }
    }
}

struct ButtonCardView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            Text("ContentView.swift DesignCode2 Created by Tom on 8/1/2020.Copyright © 2020 Tom. All rights reserved.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 8)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        
    }
}
