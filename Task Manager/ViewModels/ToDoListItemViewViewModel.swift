//
//  ToDoListItemViewViewModel.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 11/05/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject{
    func checkmarkIsDone(item: ToDoListItem) {
        var itemcopy = item
        itemcopy.isDone.toggle()
        
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("Users")
            .document(uID)
            .collection("Tasks")
            .document(itemcopy.id)
            .setData(["id" : itemcopy.id, "title" : itemcopy.title, "dueDate" : itemcopy.dueDate, "currentDate" : itemcopy.currentDate, "isDone" : itemcopy.isDone])
    }
}
