//
//  AddButtonView.swift
//  ToDoList
//
//  Created by Zakki Mudhoffar on 29/07/23.
//

import SwiftUI

struct AddButton: View {
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                NavigationLink(destination: EditView(passedTaskItem: nil, initialDate: Date())
                    .environmentObject(dateHolder)) {
                        Image(systemName: "plus")
                            .padding(15)
                            .foregroundColor(.white)
                            .background(.blue, in: Circle())
                            .padding(30)
                            .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
                    }
                
            }
        }
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
