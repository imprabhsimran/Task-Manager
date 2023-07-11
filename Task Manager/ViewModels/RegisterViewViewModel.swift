//
//  RegisterViewViewModel.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 11/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var showingAlert = false
    func register() {
        if validate() == true {
            Auth.auth().createUser(withEmail: email, password: password){ result, error in
                guard let userID = result?.user.uid else{
                    return
                }
                self.insertUserRecord(id: userID)
            }
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(userID: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("Users").document(id).setData(["name": newUser.name, "email": newUser.email, "joined": newUser.joined])
        
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter your name, email and password."
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email."
            return false
        }
        guard password.count >= 6 else {
            errorMessage = "Please make sure the length of password is above 6 characters including capitals and numbers."
            return false
        }
        return true
    }
}
