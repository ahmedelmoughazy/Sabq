//
//  VideoViewController.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/29/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class VideoViewController: BaseViewController<VideoPresenter>, VideoViewProtocol {
    @IBOutlet private weak var videoView: WKYTPlayerView!
    @IBOutlet private weak var viewsButton: UIButton!
    @IBOutlet private weak var likesButton: UIButton!
    @IBOutlet private weak var commentsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.loadVideoData()
    }

    func renderViewWithObject(material: Material) {
        viewsButton.titleLabel?.text = "\(material.noOfViews ?? 0)"
        likesButton.titleLabel?.text = "\(material.noOfLikes ?? 0)"
        commentsButton.titleLabel?.text = "\(material.noOfComments ?? 0)"
        guard let videoId = material.vid else { return }
        videoView.load(withVideoId: videoId)
        print("\(material)")
    }
}
