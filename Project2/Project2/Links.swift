//
//  Links.swift
//  Project2
//
//  Created by Smith01, Griffin on 3/20/26.
//
import UIKit

class LinksViewController: UITableViewController {
    let linkvm = LinksTableViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: "Header View")
        tableView.register(LinksTableViewCell.self, forCellReuseIdentifier: "LinksTableViewCell")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return linkvm.links.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = linkvm.links[indexPath.row]
            if let cell = tableView.dequeueReusableCell(withIdentifier: "LinksTableViewCell") as? LinksTableViewCell {
                cell.configure(link: vm)
                return cell
            }
            else{
                return UITableViewCell()
            }
        }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vm = linkvm.links[indexPath.row]
        if let url = vm.url {
          navigationController?.pushViewController(LinkDetailView(url: url), animated: true)
        } else {
            print("Could not construct URL")
        }
    }
    }


