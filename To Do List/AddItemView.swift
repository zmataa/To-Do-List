//
//  AddItemView.swift
//  To Do List
//
//  Created by Zane Matarieh on 1/28/25.
//

import SwiftUI

struct AddItemView: View {
    @ObservedObject var toDoList: ToDoList
    @State private var priority = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let priorities = ["High", "medium", "Low"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Priority", selection: $priority) {
                    ForEach(Self.priorities, id: \.self) {priority .index(after: Text(priority))}
                }
            }
        }
    }
}

#Preview {
    AddItemView(toDoList: ToDoList())
}
