//
//  FavoritesTableCell.swift
//  Project2
//
//  Created by Eddie Slobodow on 3/26/26.
//

import UIKit
import SnapKit
import AVKit
import AVFoundation

class FavoritesTableCell: UITableViewCell {
    let title = UILabel()
    let image = UIImageView()
    var videoURL : URL?
    var audioURL : URL?
    let playerViewController = AVPlayerViewController()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        title.backgroundColor = .white
        title.textColor = .black
        contentView.addSubview(image)
        image.addSubview(title)
        image.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
        // Still need to figure out how to get videos or audio to display in the cell
        /*if videoURL != nil {
                    contentView.addSubview(playerViewController.view)
                    
                    playerViewController.view.frame = contentView.bounds
                    
                    // Set video URL
                    if let url = URL(string: "https://example.com/video.mp4") {
                        let player = AVPlayer(url: videoURL ?? )
                        playerViewController.player = player
                        player.play()
                    }
        }*/
        title.snp.makeConstraints { make in
            make.centerX.equalTo(image)
            make.height.equalTo(image).dividedBy(7)
            make.width.equalTo(image)
            make.centerY.equalTo(image).offset(-10)
        }
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(vm: Favorite) {
        
        // I use this function to determain what type of object is being passed
        // and set the data accordingly
        title.text = vm.title
        
        if let destination = vm as? Destination {
            image.image = destination.image
        } else if let tour = vm as? Tours {
            videoURL = tour.videoURL
            audioURL = tour.audioURL
        }
    }
}
