//
//  NotesApp.swift
//  AdvancedTableViews
//
//  Created by Paul Igo on 3/16/25.
//

import UIKit

struct Note : Codable, Favorite {
    var title: String
    var content: String
    var photo: Data?
    // I got this method from Claude
    var image: UIImage? {
            get {
                guard let data = photo else { return nil }
                return UIImage(data: data)
            }
            set {
                photo = newValue?.jpegData(compressionQuality: 0.8)
            }
        }
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
    func createNote(title: String, content: String, imageData: Data?) {
        data[0].insert(Note(title: title, content: content, photo: imageData), at: 0)
    }
    func updateNote(at indexPath: IndexPath, title: String, content: String, imageData: Data?) {
        let note = Note(title: title, content: content, photo: imageData)
        data[indexPath.section][indexPath.row] = note
    }
}
