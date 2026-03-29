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

var favorites: [Favorite] = []


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
    func refresh() {
        objects = createDestinations()
    }
    func deleteObject(indexPath: IndexPath) {
        objects.remove(at: indexPath.row)
        //tableView.deleteRows(at: [indexPath], with: .fade)
        favorites.remove(at: indexPath.row)
    }
    
}
