//
//  VideoViewController.swift
//  MarzipanPlatter
//
//  Created by Michael Thomas on 6/13/18.
//  Copyright © 2018 Biscuit Labs. All rights reserved.
//

import UIKit
import AVKit

class VideoViewController: UIViewController {

    var avPlayerVC: AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // WWDC 2018 Keynote!
        let player = AVPlayer(url: URL(string: "https://p-events-delivery.akamaized.net/18oijbasfvuhbfsdvoijhbsdfvljkb6/m3u8/hls_vod_mvp.m3u8")!)

        // Embed AVPlayerViewController
        avPlayerVC = AVPlayerViewController()
        avPlayerVC.willMove(toParent: self)
        addChild(avPlayerVC)
        avPlayerVC.didMove(toParent: self)
        
        // Setup Player
        avPlayerVC.player = player

        // Setup Player View
        view.addSubview(avPlayerVC.view)
        avPlayerVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        avPlayerVC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        avPlayerVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        avPlayerVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        avPlayerVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
