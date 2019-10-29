//
//  VideoPresenter.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class VideoPresenter: VideoPresenterProtocol {
    
    private var videoView: VideoViewProtocol
    private var videoModel: VideoModelProtocol

    required init(view: VideoViewProtocol, model: VideoModelProtocol) {
        videoView = view
        videoModel = model
    }

    func loadVideoData() {
        let data = videoModel.getVideo()
        guard let material = data else { return }
        videoView.renderViewWithObject(material: material)
    }
}
