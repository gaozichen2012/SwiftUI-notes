//
//  ButtonPresentingAdditionalViewPage.swift
//  Example
//
//  Created by Tom on 7/1/2020.
//  Copyright © 2020 晋先森. All rights reserved.
//

import SwiftUI

struct ButtonPresentingAdditionalViewPage: View {
    @State var showSheet = false
    @State var showAlert = false
    @State var showActionSheet = false
    var body: some View {
        
        VStack(spacing: 40.0) {
            Button(action: { self.showSheet.toggle() }){
                BottonTextSonView(text: "弹出sheet-Modal模态窗口")
            }
            .sheet(isPresented: self.$showSheet) { Text("此为Modal模态窗口") }
            
            Button(action: {self.showActionSheet = true}) {
                BottonTextSonView(text: "弹出actionSheet选择窗口")
            }
            .actionSheet(isPresented: $showActionSheet, content: {sheet})
            
            Button(action: {self.showAlert = true}) {
                BottonTextSonView(text: "弹出alert报警窗口")
            }
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("alert报警窗口"),
                      message: Text("报警窗口里的内容第一行\n报警窗口里的内容第二行"),
                      primaryButton: .destructive(Text("确认")) { print("已转出") },
                      secondaryButton: .cancel())
            })
        }
    }
    
    private var sheet: ActionSheet {
        
        let action = ActionSheet(title: Text("Title"),
                                 message: Text("Message"),
                                 buttons:
            [.default(Text("Default"), action: { print("Default")
                self.showActionSheet = false
            }),.destructive(Text("destructive"), action: {
                print("destructive")
                self.showActionSheet = false
            }),.cancel({
                print("Cancel")
                self.showActionSheet = false
            })])
        
        return action
    }
}

struct ButtonPresentingAdditionalViewPage_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPresentingAdditionalViewPage()
    }
}

struct BottonTextSonView: View {
    var text = "text"
    var backColor = Color.blue
    var foregroudColor = Color.white
    var body: some View {
        Text(text)
        .bold()
        .font(.title)
        .frame(width: 350, height: 44)
        .background(backColor)
        .foregroundColor(foregroudColor)
        .cornerRadius(10)
        .shadow(radius: 3)
        .shadow(radius: 5)
    }
}
