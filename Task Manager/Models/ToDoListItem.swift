//
//  ToDoListItem.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 11/05/23.
//

import Foundation

struct ToDoListItem: Codable, Identifiable{
    let id: String
    let title: String
    let dueDate: TimeInterval
    let currentDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone( _ state: Bool){
        isDone = state
    }
}
