//
//  ProfileViewViewModel.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 11/05/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel: ObservableObject {
    @Published var user: User? = nil
    
    func fetchUser() {
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("Users").document(uId).getDocument { snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self.user = User(
                    userID: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0
                )
            }
        }
    }
    
    func signOut() {
        do{
            try Auth.auth().signOut()
        } catch {
            print("error while signing out")
        }
    }
}
