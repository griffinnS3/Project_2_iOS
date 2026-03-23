//
//  ViewController.swift
//  Project2
//
//  Created by Smith01, Griffin on 3/19/26.
//

import UIKit

class DestinationsViewController: UITableViewController {
    
    var destinationsViewModel = DestinationTableViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.register(DestinationsTableCell.self, forCellReuseIdentifier: "DestinationsCellReuseIdentifier")
    }
    
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return destinationsViewModel.objects.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DestinationsCellReuseIdentifier") as? DestinationsTableCell {
                let vm = destinationsViewModel.objects[indexPath.row]
                cell.configure(vm: vm)
                return cell
            } else {
                return UITableViewCell()
            }
            }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vm = destinationsViewModel.objects[indexPath.row]
        present(DestinationDetailView( labelText: vm.title, address: vm.title), animated: true)
    }
        }


