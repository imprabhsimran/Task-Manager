//
//  LogInView.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 11/05/23.
//

import SwiftUI

struct LogInView: View {
    @ObservedObject private var logInViewViewModel = LogInViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                
                HeaderView(title: "Task Manger", subTitle: "Get things done", color: .pink, angle: 15)
                
                Form{
                    TextField("Enter the Email", text: $logInViewViewModel.email)
                        .textFieldStyle(.automatic)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    SecureField("Password", text: $logInViewViewModel.password)
                        .textFieldStyle(.automatic)
                        .autocapitalization(.none)
                    
                    Button{
                        logInViewViewModel.logIn()
                        if !logInViewViewModel.errorMesasge.isEmpty{
                            logInViewViewModel.showingAlert.toggle()
                        }
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 17)
                                .foregroundColor(.blue)
                            Text("Log IN")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                }
                
                Text("New around here?")
                NavigationLink("Create an account", destination: RegisterView())
                .padding(.bottom, 60)
            }.alert(isPresented: $logInViewViewModel.showingAlert){
                Alert(title: Text("Error"), message: Text("\(logInViewViewModel.errorMesasge)"), dismissButton: .default(Text("OK")))
            }
            .ignoresSafeArea()
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LogInView()
        }
    }
}
