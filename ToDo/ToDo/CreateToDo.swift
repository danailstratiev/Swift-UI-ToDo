//
//  CreateToDo.swift
//  ToDo
//
//  Created by Danail on 17.01.22.
//

import SwiftUI

struct CreateToDo: View {
    
    @State var toDoTitle = ""
    @State var isImportant = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var toDoStorage: ToDoStorage
    
    var body: some View {
        List {
            Section{
                TextField("Feed the cat", text: $toDoTitle)
            }
            Section{
                Toggle(isOn: $isImportant){
                    Text("Important")
                }
            }
            Section{
                Button("Save") {
                    self.toDoStorage.toDos.append(ToDoItem(title: self.toDoTitle, important: self.isImportant))
                    self.presentationMode.wrappedValue.dismiss()
                }.disabled(toDoTitle.isEmpty)
            }
        }.listStyle(GroupedListStyle())
        
    }
}

struct CreateToDo_Previews: PreviewProvider {
    static var previews: some View {
        CreateToDo().environmentObject(ToDoStorage())
    }
}
