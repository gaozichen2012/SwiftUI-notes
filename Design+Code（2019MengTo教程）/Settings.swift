//
//  Settings.swift
//  TomSwiftUITest
//
//  Created by Tom on 3/12/2019.
//  Copyright © 2019 Tom. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @State var receive = false
    @State var number = 1
    @State var selection = 1
    @State var date = Date()
    @State var email = ""
    @State var submit = false
    
    var body: some View {
        NavigationView {
            Form { //表格，Form功能相当于list，但是不要提交数据
                Toggle(isOn: $receive) { //使用$符号是因为使用了form
                    Text("Receive notification")
                }
                
                
                
                Stepper(value: $number, in: 1...10) {
                    Text("\(number) Notification\(number > 1 ? "s" : "") per week")
                }
                Picker(selection: $selection, label: Text("Favorite")) {
                    Text("SwiftUI").tag(1)
                    Text("React").tag(2)
                }
                DatePicker(selection: $date, label: { Text("Date") })
                Section(header: Text("Email")) {
                    TextField("Your email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Button(action: {self.submit.toggle()}){
                    Text("Submit")
                }
            .alert(isPresented: $submit, content: {
                Alert(title: Text("Thanks!"), message: Text("Email:\(email)"))
            })
            }
            .navigationBarTitle("Settings")
        }
        
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
