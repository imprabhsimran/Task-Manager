//
//  ToDoListItemView.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 11/05/23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject private var toDoListItemViewViewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("\(item.title)")
                    .font(.title3)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button{
                toDoListItemViewViewModel.checkmarkIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: ToDoListItem(id: "1", title: "Code", dueDate: Date().timeIntervalSince1970, currentDate: Date().timeIntervalSince1970, isDone: false))
    }
}
