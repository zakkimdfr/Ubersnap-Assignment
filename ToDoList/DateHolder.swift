//
//  DateHolder.swift
//  ToDoList
//
//  Created by Zakki Mudhoffar on 29/07/23.
//

import SwiftUI
import CoreData

class DateHolder: ObservableObject {
    
    init(_ context: NSManagedObjectContext){
        
    }
    
    func saveContext(_ context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
