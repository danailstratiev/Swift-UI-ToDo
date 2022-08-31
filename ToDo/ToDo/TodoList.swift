//
//  ContentView.swift
//  ToDo
//
//  Created by Danail on 1.12.21.
//

import SwiftUI

struct TodoList: View {
    
    @EnvironmentObject var toDoStorage: ToDoStorage
    
    var body: some View {
        NavigationView{
            List{
                ForEach(self.toDoStorage.toDos) {
                    todo in
                    if todo.important {
                        Text(todo.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding(4)
                            .background(Rectangle())
                            .foregroundColor(.red)
                            .cornerRadius(5)
                    } else {
                        Text(todo.title)
                    }
                }.onDelete(perform: { indexSet in
                    if let index = indexSet.first {
                        self.toDoStorage.toDos.remove(at: index)
                    }
                })
            }.navigationTitle("To Dos")
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        
                                        destination: CreateToDo()) {
                                        Text("Add")
                                    }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoList().environmentObject(ToDoStorage())
    }
}
