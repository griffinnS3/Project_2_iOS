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
    var videoPlayer = AVPlayerViewController()
    var audioPlayer = AVPlayerViewController()
    var background = UILabel()
    
    init(videoURL: URL?, audioURL: URL?) {
        self.videoURL = videoURL
        self.audioURL = audioURL
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(background)
        view.addSubview(videoPlayer.view)
        view.addSubview(audioPlayer.view)
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
        if let videoURL = videoURL {
            let player = AVPlayer(url: videoURL)
            videoPlayer.player = player
        }
        if let audioURL = audioURL {
            let player = AVPlayer(url: audioURL)
            audioPlayer.player = player
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
