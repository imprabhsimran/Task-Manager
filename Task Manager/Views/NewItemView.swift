//
//  NewItemView.swift
//  Task Manager
//
//  Created by Prabh Simran Singh on 11/05/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject private var newItemViewViewModel = NewItemViewViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Text("Add new task")
                .font(.title)
                .bold()
                .padding(.top, 30)
            
            Form{
                TextField("Title", text: $newItemViewViewModel.title)
                    .textFieldStyle(.automatic)
                
                DatePicker("Due Date", selection: $newItemViewViewModel.dueDate)
                    .datePickerStyle(.graphical)
                
                Button{
                    if newItemViewViewModel.canSave {
                        newItemViewViewModel.save()
                    } else {
                        newItemViewViewModel.showAlert.toggle()
                    }
                    dismiss()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.pink)
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.title3)
                            .bold()
                    }
                }
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView()
    }
}
