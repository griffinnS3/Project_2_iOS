//
//  DestinationsViewModel.swift
//  Project2
//
//  Created by Smith01, Griffin on 3/20/26.
//
import UIKit
struct Destination : Favorite {
    var title: String
    var image: UIImage?
}

class DestinationTableViewModel: NSObject {
    
    var objects: [Destination] = []
    init(objects: [Destination]) {
        self.objects = objects
    }
   override init() {
       super.init()
        objects = createDestinations()
    }
    func createDestinations() -> [Destination] {
        return [
            Destination(title: "Church Street", image: UIImage(named: "church_street")),
            Destination(title: "Champlain College", image: UIImage(named: "champlain")),
            Destination(title: "Kountry Kart Deli", image: UIImage(named: "KKD"))
        ]
    }
}


