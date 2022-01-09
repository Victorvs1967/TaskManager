//
//  TaskSearchView.swift
//  TaskManager
//
//  Created by Victor Smirnov on 09.01.2022.
//

import SwiftUI

struct TaskSearchView: View {
    
    @ObservedObject var taskVM: TaskViewModel
    @State var isSearching = false
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                    .cornerRadius(9)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    TextField("Search ...", text: $taskVM.searched, onEditingChanged: { isBegin in
                        if isBegin {
                            isSearching = true
                        } else {
                            isSearching = false
                        }
                    })
                    .keyboardType(.webSearch)
                    .foregroundColor(.black)
                    
                    if taskVM.searched != "" {
                        Button(
                            action: { taskVM.searched = "" }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                        }
                    }
                }
                .padding(.trailing, 8)
                .padding(.leading, 12)
            }
            .frame(width: 310, height: 38)
            .padding(.leading, 7)
            .padding(.top, 5)
            .animation(.easeInOut(duration: 0.3))
            
            if isSearching {
                Button(action: {
                    hideKeyboard()
                }) {
                    Text("Cancel")
                }
            }
        }
    }
}

struct TaskSearchView_Previews: PreviewProvider {
    static var previews: some View {
        TaskSearchView(taskVM: TaskViewModel())
    }
}
