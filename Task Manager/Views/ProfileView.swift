//
//  ProfileView.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 11/05/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var profileViewViewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                if let user = profileViewViewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Name:")
                                .bold()
                            Text(user.name)
                        }.padding()
                        
                        HStack{
                            Text("Email:")
                                .bold()
                            Text(user.email)
                        }.padding()
                        
                        HStack{
                            Text("Member Since:")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }.padding()
                        
                    }
                    
                    Button{
                        profileViewViewModel.signOut()
                    } label: {
                        Text("Sign Out")
                            .bold()
                            .tint(.red)
                            .padding()
                    }
                    Spacer()
                } else {
                    ProgressView()
                    Text("Loading Profile.....")
                }
            }.navigationTitle("Profile")
             .padding()
        }.onAppear {
            profileViewViewModel.fetchUser()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
