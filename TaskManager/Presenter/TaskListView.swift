//
//  TaskListView.swift
//  TaskManager
//
//  Created by Victor Smirnov on 09.01.2022.
//

import SwiftUI

struct TaskListView: View {
    
    @ObservedObject var taskVM: TaskViewModel
    
    var body: some View {
        List {
            ForEach (taskVM.tasks.filter {
                self.taskVM.searched.isEmpty ? true : $0.name.localizedCapitalized.contains(self.taskVM.searched)
            }) { task in
                TaskView(task: task)
            }
            .onDelete(perform: { taskVM.removeTask(indexAt: $0) })
        }
        .listStyle(InsetListStyle())
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(taskVM: TaskViewModel())
    }
}
