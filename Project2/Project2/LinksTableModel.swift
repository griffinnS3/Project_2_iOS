//
//  LinksTableModel.swift
//  Project2
//
//  Created by Smith01, Griffin on 3/21/26.
//
import UIKit
struct Link {
    var title: String
    var url: URL?
}

class LinksTableViewModel: NSObject {
   
    var links: [Link] = []
    
    override init() {
        super.init()
        links = getLinks()
    }
    func getLinks() -> [Link] {
        return [
            Link(title: "Champlain College", url: URL(string: "https://www.champlain.edu/")),
            Link(title: "University of Vermont", url: URL(string: "https://www.uvm.edu/")),
            Link(title: "Kountry Kart Deli", url: URL(string: "https://www.kountrykartdeli.com/")),
        ]
    }
}
