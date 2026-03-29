//
//  ToursDetailView.swift
//  Project2
//
//  Created by Smith01, Griffin on 3/23/26.
//

import SwiftUI
import SnapKit
import AVKit
import AVFoundation


class ToursDetailView: UIViewController {
    var videoURL: URL?
    var audioURL: URL?
    var tourTitle: String
    var videoPlayer = AVPlayerViewController()
    var audioPlayer = AVPlayerViewController()
    var background = UILabel()
    var addFavorite = UIButton()
    
    init(title: String, videoURL: URL?, audioURL: URL?) {
        self.tourTitle = title
        self.videoURL = videoURL
        self.audioURL = audioURL
        
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addFavorite.setTitle("Add Favorite", for: .normal)
        addFavorite.translatesAutoresizingMaskIntoConstraints = false
        addFavorite.backgroundColor = .systemBlue
        addFavorite.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        view.addSubview(background)
        view.addSubview(videoPlayer.view)
        view.addSubview(audioPlayer.view)
        view.addSubview(addFavorite)
        background.backgroundColor = .black
        background.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        videoPlayer.view.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.height.equalTo(view.safeAreaLayoutGuide).dividedBy(3)
            make.width.equalTo(view)
            make.centerX.equalTo(view)
        }
        audioPlayer.view.snp.makeConstraints { make in
            make.top.equalTo(videoPlayer.view.snp.bottom).offset(50)
            make.height.equalTo(view.safeAreaLayoutGuide).dividedBy(3)
            make.width.equalTo(view)
            make.centerX.equalTo(view)
        }
        addFavorite.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view).multipliedBy(0.2)
            make.height.equalTo(view.safeAreaLayoutGuide).dividedBy(13)
            make.trailing.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.95)
        }
        if let videoURL = videoURL {
            let player = AVPlayer(url: videoURL)
            videoPlayer.player = player
        }
        if let audioURL = audioURL {
            let player = AVPlayer(url: audioURL)
            audioPlayer.player = player
        }
        
        addFavorite.addTarget(self, action: #selector(favoriteAdded), for: .touchUpInside)

    }
    
    @objc func favoriteAdded() {
        print("Added to favorites")
        let thisTour = Tours(title: tourTitle, videoURL: videoURL, audioURL: audioURL)
        favorites.append(thisTour)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
