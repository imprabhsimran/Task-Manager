//
//  ToDoListViewViewModel.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 11/05/23.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class ToDoListViewViewModel: ObservableObject {
    @Published var presentAddNewItemView = false
    
    func delete(id: String){
        
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("Users")
            .document(uID)
            .collection("Tasks")
            .document(id)
            .delete()
    }
}
