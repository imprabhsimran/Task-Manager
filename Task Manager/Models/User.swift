//
//  User.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 11/05/23.
//

import Foundation


struct User: Codable {
    let userID: String
    let name: String
    let email: String
    let joined: TimeInterval
}
