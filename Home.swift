//
//  Home.swift
//  TomSwiftUITest
//
//  Created by Tom on 27/11/2019.
//  Copyright © 2019 Tom. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            MenuRow(image: "person.crop.circle", text: "My Account")
            MenuRow(image: "creditcard", text: "Billing")
            MenuRow(image: "person.and.person", text: "Team")
            MenuRow(image: "arrow.uturn.down", text: "Sign out")
            Spacer()
        }
        .padding(.top,20)
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuRow: View {
    var image = "creditcard"
    var text = "My Account"
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32) //目的让图标大小一致
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}
