import Foundation

struct Task {
    let id: Int
    var description: String
    var isCompleted: Bool
}

class ToDoList {
    private var tasks: [Task] = []
    private var nextId = 1
    
    func addTask(description: String) {
        let task = Task(id: nextId, description: description, isCompleted: false)
        tasks.append(task)
        nextId += 1
    }
    
    func listTasks() {
        for task in tasks {
            print("[\(task.isCompleted ? "x" : " ")] \(task.id): \(task.description)")
        }
    }
    
    func completeTask(id: Int) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isCompleted = true
        } else {
            print("Task with ID \(id) not found.")
        }
    }
    
    func removeTask(id: Int) {
        tasks.removeAll { $0.id == id }
    }
}

func getInput(prompt: String) -> String {
    print(prompt, terminator: ": ")
    return readLine() ?? ""
}

let toDoList = ToDoList()

while true {
    print("\nCommands: add, list, complete, remove, exit")
    let command = getInput(prompt: "Enter command")
    
    switch command {
    case "add":
        let description = getInput(prompt: "Enter task description")
        toDoList.addTask(description: description)
    case "list":
        toDoList.listTasks()
    case "complete":
        let idString = getInput(prompt: "Enter task ID to complete")
        if let id = Int(idString) {
            toDoList.completeTask(id: id)
        } else {
            print("Invalid ID")
        }
    case "remove":
        let idString = getInput(prompt: "Enter task ID to remove")
        if let id = Int(idString) {
            toDoList.removeTask(id: id)
        } else {
            print("Invalid ID")
        }
    case "exit":
        exit(0)
    default:
        print("Unknown command")
    }
}
