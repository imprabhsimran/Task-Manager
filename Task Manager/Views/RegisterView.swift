//
//  RegisterView.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 11/05/23.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject private var registerViewViewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            HeaderView(title: "Register", subTitle: "Start organizing your tasks", color: .yellow, angle: -15)
            
            Form{
                TextField("Enter your name", text: $registerViewViewModel.name)
                    .disableAutocorrection(true)
                TextField("Enter your email", text: $registerViewViewModel.email)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                TextField("Enter your password", text: $registerViewViewModel.password)
                    .autocapitalization(.none)
                
                Button{
                    registerViewViewModel.register()
                    if !registerViewViewModel.errorMessage.isEmpty {
                        registerViewViewModel.showingAlert.toggle()
                    }
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.green)
                        Text("Create Account")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
        }.alert(isPresented: $registerViewViewModel.showingAlert){
            Alert(title: Text("Error"), message: Text("\(registerViewViewModel.errorMessage)"), dismissButton: .default(Text("OK")))
        }
        .ignoresSafeArea()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
