//
//  ContentView.swift
//  ToDoList
//
//  Created by Zakki Mudhoffar on 29/07/23.
//

import SwiftUI
import CoreData

struct TaskView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskItem.dueDate, ascending: true)],
        animation: .default)
    private var items: FetchedResults<TaskItem>

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    List {
                        ForEach(items) { taskItem in
                            NavigationLink(destination: EditView(passedTaskItem: taskItem, initialDate: Date())
                                .environmentObject(dateHolder)) {
                                    TaskCell(passedTaskItem: taskItem)
                                        .environmentObject(dateHolder)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                    }
                    AddButton()
                        .environmentObject(dateHolder)
                }
            }
            .navigationTitle("My To Do List")
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            dateHolder.saveContext(viewContext)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
