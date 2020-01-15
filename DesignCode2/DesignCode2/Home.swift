//
//  Home.swift
//  DesignCode2
//
//  Created by Tom on 15/1/2020.
//  Copyright © 2020 Tom. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var showProfile = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)//忽略安全区域
            
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {self.showProfile.toggle()}) {
                        Image("Avatar")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                Spacer()
            }
            .padding(.top,44)
            .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(radius: 20)
            .offset(y: showProfile ? -450 : 0)
            .rotation3DEffect(.degrees(showProfile ? -10 : 0), axis: (x: 10, y: 0, z: 0))
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.easeInOut(duration: 0.2))
            .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .offset(y: showProfile ? 0 : 600)
                .animation(.easeInOut(duration: 0.2))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
