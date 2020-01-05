//
//  SettingsViewPage.swift
//  Example
//
//  Created by Tom on 5/1/2020.
//  Copyright © 2020 晋先森. All rights reserved.
//

import SwiftUI
import Combine

struct SettingsViewPage: View {
    @State var receive = false
    @State var number = 1
    @State var selection = 1
    @State var date = Date()
    @State var email1 = ""
    @State var email2 = ""
    @State var rating = 0.5
    @State var submit = false
    var body: some View {
        NavigationView {
            Form { //表格，Form功能相当于list，但是不要提交数据
                Section(header: Text("1种Toggle和1种Stepper")) {
                    Toggle(isOn: $receive) {
                        Text("Receive notification")
                    }
                    
                    Stepper(value: $number, in: 1...10) {
                        Text("\(number) Notification\(number > 1 ? "s" : "") per week")
                    }
                }
                
                Section(header: Text("2种TextField和2种SecureField")) {
                    TextField("TextField样式1", text: $email1)
                    TextField("TextField样式2", text: $email2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("SecureField样式1", text: $email2)
                    SecureField("SecureField样式2", text: $email2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Section(header: Text("1种Alert和1种Slider")) {
                    Button(action: {self.submit.toggle()}){
                        Text("Submit")
                    }
                    .alert(isPresented: $submit, content: {
                        Alert(title: Text("Thanks!"), message: Text("Email:\(email1)"))
                    })
                    VStack {
                        Text("Slider Value: \(self.rating)")
                        Slider(value: $rating)
                            .padding(30)
                    }
                }
                Section(header: Text("3种Picker样式")) {
                    Picker(selection: $selection, label: Text("Favorite")) {
                        Text("SwiftUI").tag(1)
                        Text("React").tag(2)
                    }
                    
                    Picker(selection: $selection, label: Text("Favorite")) {
                        Text("SwiftUI").tag(1)
                        Text("React").tag(2)
                    }
                    .pickerStyle(WheelPickerStyle())
                    
                    VStack {
                        Text("Favorite").bold()
                        Picker("Favorite", selection: $selection) {
                            Text("SwiftUI").tag(1)
                            Text("React").tag(2)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                Section(header: Text("2种DatePicker样式")) {
                    DatePicker(selection: $date, label: { Text("Date") })
                    DatePicker(selection: $date, label: { Text("Date") })
                        .datePickerStyle(WheelDatePickerStyle())
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsViewPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsViewPage()
    }
}

