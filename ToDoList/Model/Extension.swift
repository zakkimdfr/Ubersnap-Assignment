//
//  Extension.swift
//  ToDoList
//
//  Created by Zakki Mudhoffar on 29/07/23.
//

import SwiftUI

extension TaskItem {
    func isCompleted() -> Bool {
        return completedDate != nil
    }
}

