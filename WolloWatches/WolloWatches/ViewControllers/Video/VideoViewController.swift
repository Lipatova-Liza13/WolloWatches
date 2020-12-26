//
//  VideoViewController.swift
//  WolloWatches
//
//  Created by Macbook on 02.11.2020.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import UIKit
import WebKit

class VideoViewController: UIViewController {

    @IBOutlet weak var videoName: UILabel!
    @IBOutlet weak var videoView: WKWebView!
    var currentVideo = Video(key: "", name: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getVideo(name: currentVideo.name, videoKey: currentVideo.key)
    }
    
    func getVideo(name: String, videoKey: String) {
        videoName.text = name
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")
        videoView.load(URLRequest(url: url!))
    }
}
