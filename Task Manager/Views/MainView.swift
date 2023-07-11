//
//  ContentView.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 11/05/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject private var mainViewViewModel = MainViewViewModel()
    var body: some View {
        if mainViewViewModel.isSignedIn, !mainViewViewModel.currentUserID.isEmpty {
            TabView {
                ToDoListView(userID: mainViewViewModel.currentUserID)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        } else {
            LogInView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
