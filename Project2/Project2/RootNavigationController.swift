//
//  ViewController.swift
//  AdvancedTableViews
//
//  Created by Paul Igo on 3/16/25.
//

import UIKit

class RootNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers([RootTabBar()], animated: true)
    }

}
class RootTabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let notesVc = UINavigationController(rootViewController: TableViewController())
        let destinationsVc = UINavigationController(rootViewController: DestinationsViewController())
        let toursVc = UINavigationController(rootViewController: ToursViewController())
        let favoritesVc = UINavigationController(rootViewController: FavoritesView())
        let linksVc = UINavigationController(rootViewController: LinksViewController())

        notesVc.tabBarItem.image = UIImage(systemName: "list.bullet")
        destinationsVc.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        toursVc.tabBarItem.image = UIImage(systemName: "map")
        favoritesVc.tabBarItem.image = UIImage(systemName: "star")
        linksVc.tabBarItem.image = UIImage(systemName: "link")
        setViewControllers(
            [notesVc, destinationsVc, toursVc, favoritesVc, linksVc],
            animated: true
        )
    }
}


