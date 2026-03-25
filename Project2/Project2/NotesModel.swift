//
//  NotesApp.swift
//  AdvancedTableViews
//
//  Created by Paul Igo on 3/16/25.
//

import UIKit

struct Note : Codable {
    var title: String
    var content: String
//    var photo: Data?
}
class NotesViewModel : NSObject {
    
    var data: [[Note]] = [[]]
    
    override init() {
        super.init()
        data = allNotes()
    }
    
    func allNotes() -> [[Note]] {
        return [
            [
                Note(title: "Note 1, Section 1", content: "Section 1"),
                Note(title: "Note 2, Section 1", content: "Section 1"),
                Note(title: "Note 3, Section 1", content: "Section 1"),
                Note(title: "Note 4, Section 1", content: "Section 1"),
                Note(title: "Note 5, Section 1", content: "Section 1"),
                Note(title: "Note 6, Section 1", content: "Section 1"),
                
            ],
            [
                Note(title: "Note 1, Section 2", content: "Section 2"),
                Note(title: "Note 2, Section 2", content: "Section 2"),
                Note(title: "Note 3, Section 2", content: "Section 2"),
                Note(title: "Note 4, Section 2", content: "Section 2"),
                Note(title: "Note 5, Section 2", content: "Section 2"),
                Note(title: "Note 6, Section 2", content: "Section 2"),
            ],
            [
                Note(title: "Note 1, Section 3", content: "Section 3"),
                Note(title: "Note 2, Section 3", content: "Section 3"),
                Note(title: "Note 3, Section 3", content: "Section 3"),
            ]
        ]
    }
    func object(for indexPath: IndexPath) -> Note? {
        return data[indexPath.section][indexPath.row]
    }
    func swap(source: IndexPath, destination: IndexPath) {
        let vm = data[source.section].remove(at: source.row)
        data[destination.section].insert(vm, at: destination.row)
    }
    func deleteObject(indexPath: IndexPath) {
        data[indexPath.section].remove(at: indexPath.row)
    }
}
