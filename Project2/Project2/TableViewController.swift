//
//  TableView.swift
//  AdvancedTableViews
//
//  Created by Paul Igo on 3/16/25.
//

import UIKit

class TableViewController: UITableViewController {
    
    let viewModel = NotesViewModel()
    
    override func viewDidLoad() {
        tableView.delegate = self
        
        tableView.register(NotesTableViewCell.self, forCellReuseIdentifier: "NotesTableViewCell")
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: "Header View")
        tableView.register(FooterView.self, forHeaderFooterViewReuseIdentifier: "Footer View")
        navigationItem.rightBarButtonItem = editButtonItem
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let vm = viewModel.object(for: indexPath),
           let cell = tableView.dequeueReusableCell(withIdentifier: "NotesTableViewCell") as? NotesTableViewCell {
            cell.configure(note: vm)
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data[section].count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.data.count
    }
    override func viewWillDisappear(_ animated: Bool) {
        if let encoded = try? JSONEncoder().encode(viewModel.data) {
            UserDefaults.standard.set(encoded, forKey: "savedData")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(UIImage.add.pngData(), forKey: "Image")
        if let data = defaults.data(forKey: "Image") {
//            viewModel.object.photo = UIImage(data: data)
        }
        if let savedData = UserDefaults.standard.data(forKey: "savedData"),
           let decodedData = (try? JSONDecoder().decode(
            [[Note]].self,
            from: savedData
           )) {
            viewModel.data = decodedData
        }
    }
}
extension TableViewController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Section \(section)"
    }
    }
extension TableViewController {
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        viewModel.swap(source: sourceIndexPath, destination: destinationIndexPath)
        tableView.reloadData()
    }
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteObject(indexPath: indexPath)
            tableView.reloadData()
        }
    }
}






