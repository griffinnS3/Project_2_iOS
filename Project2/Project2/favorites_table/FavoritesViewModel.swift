//
//  FavoritesViewModel.swift
//  Project2
//
//  Created by Eddie Slobodow on 3/26/26.
//
import UIKit

protocol Favorite: Encodable {
    var title: String { get }
}
//I got help from claude converting the protocol into something that could be encoded and saved to user defaults
/**https://claude.ai/chat/649a0c36-2908-4329-b081-d00b37aefca5**/
enum FavoriteItem: Codable {
    case destination(Destination)
    case tour(Tours)
    case note(Note)
    
    var favorite: Favorite {
        switch self {
        case .destination(let d): return d
        case  .tour(let t): return t
        case .note(let n): return n
        }
    }
}
var favorites: [Favorite] = []


class FavoritesTableViewModel:  NSObject {
    
    var objects: [Favorite] = []
//    init(objects: [Favorite]) {
//        self.objects = objects
//    }
   override init() {
       super.init()
       objects = FavoritesTableViewModel.load()
    }
    func save() {
        let items = objects.compactMap { favorite -> FavoriteItem? in
            if let d = favorite as? Destination {return .destination(d)}
            if let t = favorite as? Tours {return .tour(t)}
            if let n = favorite as? Note {return .note(n)}
            return nil
        }
        print("Saving items")
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "favorites")
        }
    }
        static func load() -> [Favorite] {
            guard let savedData = UserDefaults.standard.data(forKey: "favorites"),
                  let decoded = try? JSONDecoder().decode([FavoriteItem].self, from: savedData)
            else {
                print("Nothing to load")
                return favorites
            }
            print("Loaded \(decoded.count) favorites")
            return decoded.map {$0.favorite}}
        
    func createDestinations() -> [Favorite] {
        return favorites
    }
    func refresh() {
        for favorite in favorites {
            if !objects.contains(where: { $0.title == favorite.title }) {
                objects.insert(favorite, at: 0)
            }
        }
    }
    func deleteObject(indexPath: IndexPath) {
        objects.remove(at: indexPath.row)
        //tableView.deleteRows(at: [indexPath], with: .fade)
        favorites.remove(at: indexPath.row)
        save()
    }
    func swap(source: IndexPath, destination: IndexPath) {
        let vm = objects.remove(at: source.row)
        objects.insert(vm, at: destination.row)
        save()
    }
    
}
