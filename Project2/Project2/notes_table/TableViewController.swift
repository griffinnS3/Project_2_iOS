//
//  TableView.swift
//  AdvancedTableViews
//
//  Created by Paul Igo on 3/16/25.
//

import UIKit
import SnapKit

class TableViewController: UITableViewController {
    
    let viewModel = NotesViewModel()
    let button = UIBarButtonItem()
    
    override func viewDidLoad() {
        tableView.delegate = self
        /**https://stackoverflow.com/questions/69998770/swiftui-table-rowheight-on-macos**/
        tableView.rowHeight = 80
        
        tableView.register(NotesTableViewCell.self, forCellReuseIdentifier: "NotesTableViewCell")
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: "Header View")
        tableView.register(FooterView.self, forHeaderFooterViewReuseIdentifier: "Footer View")
        navigationItem.rightBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addNote))
        if let savedData = UserDefaults.standard.data(forKey: "savedData"),
           let decodedData = (try? JSONDecoder().decode(
            [[Note]].self,
            from: savedData
           )) {
            viewModel.data = decodedData
        }
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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(NoteDetailView(title: viewModel.data[indexPath.section][indexPath.row].title, text: viewModel.data[indexPath.section][indexPath.row].content, viewModel: viewModel, isNew: false, indexPath: indexPath), animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {       
        tableView.reloadData()
    }
    @objc func addNote () {
        let detailVC = NoteDetailView(title: "", text: "", viewModel: viewModel, isNew: true, indexPath: IndexPath(row: 0, section: 0))
        navigationController?.pushViewController(detailVC, animated: true)
        
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







