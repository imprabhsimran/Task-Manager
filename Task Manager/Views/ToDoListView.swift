//
//  ToDoListView.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 11/05/23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject private var toDoListViewViewModel = ToDoListViewViewModel()
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userID: String) {
        self._items = FirestoreQuery(collectionPath: "Users/\(userID)/Tasks")
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete"){
                                toDoListViewViewModel.delete(id: item.id)
                            }.tint(.red)
                        }
                }.listStyle(.plain)
            }.navigationTitle("Task Manager")
             .toolbar {
                Button{
                    toDoListViewViewModel.presentAddNewItemView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }.sheet(isPresented: $toDoListViewViewModel.presentAddNewItemView){
            NewItemView()
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userID: "v243lItt7Of18GvfnYkgIJr9vuw1")
    }
}
