//
//  ContentView.swift
//  To Do List
//
//  Created by Zane Matarieh on 1/22/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var toDoList = ToDoList()
    var body: some View {
        NavigationView {
            List {
                ForEach(toDoList.items) { item in
                    VStack(alignment: .leading, content : {
                        Text(item.priority).font(.headline)
                             Text(item.description)
                    })
                }
                .onMove(perform: { indices, newOffset in
                    toDoList.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    toDoList.items.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("To Do List", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

#Preview {
    ContentView()
}

struct ToDoItem: Identifiable {
    var id = UUID()
    var priority = String()
    var description = String()
    var dueDate = Date()
}
