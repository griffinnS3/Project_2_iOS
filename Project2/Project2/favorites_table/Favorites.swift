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
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            /*
            favoriteViewModel.objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            favorites.remove(at: indexPath.row)
            */
            let vm = favoriteViewModel.objects[indexPath.row]
            if let destination = vm as? Destination {
                navigationController?.pushViewController(DestinationDetailView( labelText: destination.title, address: destination.title), animated: true)
            } else if let tour = vm as? Tours {
                navigationController?.pushViewController(ToursDetailView( videoURL: tour.videoURL, audioURL: tour.audioURL), animated: true)
            } else if let note = vm as? Note {
                navigationController?.pushViewController(NoteDetailView( title: note.title, text: note.content, viewModel: NotesViewModel(), isNew: false, indexPath: indexPath), animated: true)
            }
            
        }
}

