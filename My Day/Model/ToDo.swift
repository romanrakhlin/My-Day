//
//  ToDo.swift
//  My Day
//
//  Created by Roman Rakhlin on 19.12.2019.
//  Copyright © 2019 Roman Rakhlin. All rights reserved.
//

import Foundation
import Firebase

struct ToDo : Codable, Comparable {
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("todos").appendingPathExtension("plist")

    var title : String
    var isComplete : Bool
    var notes : String?
    var documentID : String?
    
    init(title: String, isComplete: Bool, notes: String?) {
        self.title = title
        self.isComplete = isComplete
        self.notes = notes
        self.documentID = ""
    }
    
    init(dictionary : [String : Any]) {
        self.title = dictionary["title"] as! String
        self.isComplete = dictionary["isCompleted"] as! Bool
        self.notes = dictionary["notes"] as! String?
    }
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: ArchiveURL) else { return nil }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
    
    static func saveToDos(_ todos : [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(todos)
        try? codedToDos?.write(to: ArchiveURL, options: .noFileProtection)
        
        
    }
    
    static func loadSampleToDo() -> [ToDo] {
        let toDo1 = ToDo(title: "Todo 1", isComplete: false, notes: "Notes 1")
        let toDo2 = ToDo(title: "Todo 2", isComplete: false, notes: "Notes 2")
        let toDo3 = ToDo(title: "Todo 3", isComplete: false, notes: "Notes 3")
        return [toDo1, toDo2, toDo3]
    }
    
    
    static let dueDateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()

    var dictionary: [String: Any] {
        return [
            "title" : self.title,
            "isComplete" : self.isComplete,
            "notes" : self.notes,
        ]
    }
    
    static func < (todo1: ToDo, todo2: ToDo) -> Bool {
        if todo1.isComplete != todo2.isComplete {
            if !todo1.isComplete {return true} else {return false}
        } else {
            return true
        }
    }
}
