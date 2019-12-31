//
//  SFSymbolsViewPage.swift
//  Example
//
//  Created by Tom on 30/12/2019.
//  Copyright © 2019 晋先森. All rights reserved.
//

import SwiftUI

struct SFSymbolsViewPage: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 40) {
                VStack(alignment: .leading) {
                    Text(".foregroundColor(.green)")
                    Text(".imageScale(.large)")
                    Text(".scaleEffect(2)")
                    Text(".shadow(radius: 5)")
                }
                Image(systemName: "cloud.sleet.fill")
                Image(systemName: "cloud.sleet.fill")
                    .foregroundColor(.green)
                    .imageScale(.large)
                    .scaleEffect(2)
                    .shadow(radius: 5)
            }
            
            HStack(spacing: 40) {
                VStack(alignment: .leading) {
                    Text(".imageScale(.small)")
                    Text(".imageScale(.large)")
                    Text(".imageScale(.medium)")
                }
                Image(systemName: "star.fill")
                    .imageScale(.small)
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                Image(systemName: "star.fill")
                    .imageScale(.large)
            }
            
            HStack(spacing: 20.0) {
                Image(systemName: "house")
                Image(systemName: "plus.app")
                Image(systemName: "plus.circle")
                Image(systemName: "bubble.left")
                Image(systemName: "video")
                Image(systemName: "heart")
                Image(systemName: "bookmark")
                Image(systemName: "flag")
                Image(systemName: "person")
                Image(systemName: "person.2")
            }
            HStack(spacing: 20.0) {
                Image(systemName: "house.fill")
                Image(systemName: "plus.app.fill")
                Image(systemName: "plus.circle.fill")
                Image(systemName: "bubble.left.fill")
                Image(systemName: "video.fill")
                Image(systemName: "heart.fill")
                Image(systemName: "bookmark.fill")
                Image(systemName: "flag.fill")
                Image(systemName: "person.fill")
                Image(systemName: "person.2.fill")
            }
            HStack(spacing: 20.0) {
                Image(systemName: "play")
                Image(systemName: "clock")
                Image(systemName: "stopwatch")
                Image(systemName: "staroflife")
                Image(systemName: "shield")
                Image(systemName: "equal.square")
            }
            HStack(spacing: 20.0) {
                Image(systemName: "play.fill")
                Image(systemName: "clock.fill")
                Image(systemName: "stopwatch.fill")
                Image(systemName: "staroflife.fill")
                Image(systemName: "shield.fill")
                Image(systemName: "equal.square.fill")
                
            }
            HStack {
                Image(systemName: "plus")
                Image(systemName: "star.fill")
                Image(systemName: "checkmark")
                Image(systemName: "pencil")
                Image(systemName: "square.and.pencil")
                Image(systemName: "list.bullet")
                Image(systemName: "text.alignleft")
                Image(systemName: "pencil")
            }
            Spacer()
        }
        
    }
}

struct SFSymbolsViewPage_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolsViewPage()
    }
}
