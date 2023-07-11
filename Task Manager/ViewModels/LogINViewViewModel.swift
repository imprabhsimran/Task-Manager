//
//  LogINViewViewModel.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 11/05/23.
//

import Foundation
import FirebaseAuth

class LogInViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMesasge = ""
    @Published var showingAlert = false
    func logIn() {
        if validate() == true {
            Auth.auth().signIn(withEmail: email, password: password)
        }
    }
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty &&
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMesasge = "Please enter your email and password."
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            errorMesasge = "Please enter a valid email."
            return false
        }
        
        return true
    }
}
