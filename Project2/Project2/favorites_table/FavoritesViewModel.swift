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
        return [
            Destination(title: "Church Street", image: UIImage(named: "church_street")),
            Destination(title: "Champlain College", image: UIImage(named: "champlain")),
            Destination(title: "Kountry Kart Deli", image: UIImage(named: "KKD")),
            Tours(title: "TestTour", videoURL: URL("https://www.youtube.com/watch?v=2PuFyjAs7JA"), audioURL: URL("https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"))
        ]
    }
}
