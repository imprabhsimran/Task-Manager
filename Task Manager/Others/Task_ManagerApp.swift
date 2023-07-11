//
//  Task_ManagerApp.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 11/05/23.
//

import Firebase
import SwiftUI

@main
struct Task_ManagerApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
