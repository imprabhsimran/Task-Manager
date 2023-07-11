//
//  NewItemViewViewModel.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 11/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    func save() {
        
        guard canSave else{
            return
        }
        
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newID = UUID().uuidString
        let newItem = ToDoListItem(id: newID, title: title, dueDate: dueDate.timeIntervalSince1970, currentDate: Date().timeIntervalSince1970, isDone: false)
        
        let db = Firestore.firestore()
        db.collection("Users")
            .document(uID)
            .collection("Tasks")
            .document(newID)
            .setData(["id" : newItem.id, "title" : newItem.title, "dueDate" : newItem.dueDate, "currentDate" : newItem.currentDate, "isDone" : newItem.isDone])
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
    }
}
