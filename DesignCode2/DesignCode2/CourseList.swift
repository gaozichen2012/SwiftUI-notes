//
//  CourseList.swift
//  DesignCode2
//
//  Created by Tom on 20/1/2020.
//  Copyright © 2020 Tom. All rights reserved.
//

import SwiftUI

struct CourseList: View {
    
    var body: some View {
        VStack {
            CourseView()
        }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @State var show = false
    var body: some View {
        ZStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 30.0) {
                    Text("CourseList.swift DesignCode2 Created by Tom on 20/1/2020.Copyright © 2020 Tom. All rights reserved.")
                    Text("About this course")
                        .font(.title).bold()
                    Text("CourseList.swift DesignCode2 Created by Tom on 20/1/2020.Copyright © 2020 Tom. All rights reserved.CourseList.swift DesignCode2 Created by Tom on 20/1/2020.Copyright © 2020 Tom. All rights reserved.CourseList.swift DesignCode2 Created by Tom on 20/1/2020.Copyright © 2020 Tom. All rights reserved.")
                    Text("CourseList.swift DesignCode2 Created by Tom on 20/1/2020.Copyright © 2020 Tom. All rights reserved.CourseList.swift DesignCode2 Created by Tom on 20/1/2020.Copyright © 2020 Tom. All rights reserved.")
                }
                .padding(30)
                .frame(maxWidth: show ? .infinity : screen.width - 60,maxHeight: show ? .infinity :280, alignment: .top)
                .offset(y:show ? 460 : 0)
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 30,style: .continuous))
                .shadow(radius: 20)
                .opacity(show ? 1 : 0)

            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("SwiftUI Advanced")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                        Text("20 Section")
                            .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                        
                    }
                    Spacer()
                    ZStack {
                        Image(uiImage: #imageLiteral(resourceName: "Logo1"))
                            .opacity(show ? 0 : 1)
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    }
                    .frame(width: 36, height: 36)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                    .clipShape(Circle())
                    .opacity(show ? 1 : 0)
                }
                Spacer()
                Image(uiImage: #imageLiteral(resourceName: "Card6"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height:140, alignment: .top)
            }
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 0)
            .frame(maxWidth: show ? .infinity : screen.width-60, maxHeight: show ? 460 : 280)
            .background(Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 30,style: .continuous))
            .shadow(radius: 20)
                
            .onTapGesture {
                self.show.toggle()
            }
        }
        .animation(.easeInOut(duration: 0.2))
    }
    //    }
}
