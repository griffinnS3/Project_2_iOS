//
//  Tours.swift
//  Project2
//
//  Created by Smith01, Griffin on 3/20/26.
//


import UIKit
import AVKit
import AVFoundation
/**https://stackoverflow.com/questions/25348877/how-to-play-a-local-video-with-swift**/
struct Tours {
var title: String
var videoURL: URL?
var audioURL: URL?

}
class ToursViewController: UITableViewController {
    let toursvm = ToursTableModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.register(ToursTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toursvm.tours.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = toursvm.tours[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ToursTableViewCell {
            cell.configure(tour: vm)
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vm = toursvm.tours[indexPath.row]
        navigationController?.pushViewController(ToursDetailView(videoURL: vm.videoURL, audioURL: vm.audioURL),animated: true)
    }
}
class ToursTableViewCell: UITableViewCell {
    var label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.height.equalTo(contentView).dividedBy(3)
            make.width.equalTo(contentView.safeAreaLayoutGuide)
            make.centerX.equalTo(contentView.safeAreaLayoutGuide)
            make.centerY.equalTo(contentView.safeAreaLayoutGuide)
        }
    }
    func configure(tour: Tours) {
        label.text = tour.title
        label.adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
class ToursTableModel: NSObject {
    
    var tours: [Tours] = []
    
    override init() {
        super.init()
        tours = getTours()
    }
    func getTours() -> [Tours] {
        let path = Bundle.main.path(forResource: "cat", ofType: "MP4")
        ?? ""
        let audioPath = Bundle.main.path(forResource: "test", ofType: "mp3") ?? ""
        return [
            Tours(title: "Champlain College", videoURL: URL(fileURLWithPath: path), audioURL: URL(fileURLWithPath: audioPath)),
            Tours(title: "KKD", videoURL: URL(fileURLWithPath: path), audioURL: URL(fileURLWithPath: audioPath)),
            Tours(title: "ADog Skate Park", videoURL: URL(fileURLWithPath: path) , audioURL: URL(fileURLWithPath: audioPath)),
        ]
    }
}
