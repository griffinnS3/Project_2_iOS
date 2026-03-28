//
//  FavoritesViewModel.swift
//  Project2
//
//  Created by Eddie Slobodow on 3/26/26.
//
import UIKit

protocol Favorite {
    var title: String { get }
}
let path = Bundle.main.path(forResource: "cat", ofType: "MP4")
?? ""
let audioPath = Bundle.main.path(forResource: "test", ofType: "mp3") ?? ""
var favorites: [Favorite] = [
    Destination(title: "Church Street", image: UIImage(named: "church_street")),
    Destination(title: "Champlain College", image: UIImage(named: "champlain")),
    Destination(title: "Kountry Kart Deli", image: UIImage(named: "KKD")),
    Tours(title: "KKD", videoURL: URL(fileURLWithPath: path), audioURL: URL(fileURLWithPath: audioPath)),
    Note(title: "Note 3, Section 1", content: "Section 1")
]


class FavoritesTableViewModel: NSObject {
    
    var objects: [Favorite] = []
    init(objects: [Favorite]) {
        self.objects = objects
    }
   override init() {
       super.init()
        objects = createDestinations()
    }
    func createDestinations() -> [Favorite] {
        return favorites
    }
}
