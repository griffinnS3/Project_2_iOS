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
        tableView.rowHeight = 100
        navigationItem.title = "Favorites"
        navigationItem.rightBarButtonItem = editButtonItem
        tableView.register(FavoritesTableCell.self, forCellReuseIdentifier: "FavoritesCellReuseIdentifier")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        favoriteViewModel.refresh()
        tableView.reloadData()
    }
    override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
        favoriteViewModel.save()
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
        let vm = favoriteViewModel.objects[indexPath.row]
        if let destination = vm as? Destination {
            navigationController?.pushViewController(DestinationDetailView( labelText: destination.title, address: destination.title), animated: true)
        } else if let tour = vm as? Tours {
            navigationController?.pushViewController(ToursDetailView( title: tour.title, videoURL: tour.videoURL, audioURL: tour.audioURL), animated: true)
        } else if let note = vm as? Note {
            navigationController?.pushViewController(NoteDetailView( title: note.title, text: note.content, viewModel: NotesViewModel(), isNew: false, indexPath: indexPath), animated: true)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            favoriteViewModel.deleteObject(indexPath: indexPath)
            tableView.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        favoriteViewModel.swap(source: sourceIndexPath, destination: destinationIndexPath)
        tableView.reloadData()
    }
}


