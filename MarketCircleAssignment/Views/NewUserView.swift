//
//  NewUserView.swift
//  MarketCircleAssignment
//
//  Created by Arrax on 06/03/24.
//

import SwiftUI

struct NewUserView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var title = ""
    @State private var ageString = ""
    @State private var phone = ""
    @State private var email = ""
    @State var showError = false

    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Age", text: $ageString)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Phone", text: $phone)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action : {
                if(name == "" || email == ""){
                    showError = true
                } else {
                    if let age = Int(ageString) {
                        let userInfo = UserInfoDataModel(name: name, info: info(title: title, age: age, phone: phone, email: email))
                        if AddNewUserData.shared.writeDataToFile(data: userInfo){
                            print("Data successfully added")
                        }
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.blue)
                    .frame(width: 100, height: 50)
                    .overlay(
                    Text("Save")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.white)
                    )
                    .opacity(1.0)
            }
            .padding()
        }
        .alert(isPresented: $showError) {
                    Alert(title: Text("Error"), message: Text("Name or Email is empty!"), dismissButton: .default(Text("OK")))
                }
    }
}
