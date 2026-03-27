//
//  Favorites.swift
//  Project2
//
//  Created by Smith01, Griffin on 3/20/26.
//

import UIKit

class FavoritesView: UITableViewController {

    var favoriteViewModel = FavoritesTableViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.register(FavoritesTableCell.self, forCellReuseIdentifier: "FavoritesCellReuseIdentifier")
    }
    
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return favoriteViewModel.objects.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesCellReuseIdentifier") as? FavoritesTableCell {
                let vm = favoriteViewModel.objects[indexPath.row]
                cell.configure(vm: vm)
                return cell
            } else {
                return UITableViewCell()
            }
            }
}

