//
//  MainViewViewModel.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 11/05/23.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    @Published var currentUserID = ""
    
    init() {
        _ = Auth.auth().addStateDidChangeListener { _, user in
            self.currentUserID = user?.uid ?? ""
        }
    }
    
    public var isSignedIn : Bool {
        return Auth.auth().currentUser != nil
    }
}
