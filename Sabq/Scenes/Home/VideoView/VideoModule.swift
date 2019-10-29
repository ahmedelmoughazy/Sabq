//
//  VideoModule.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class VideoModule {
    class func getvideoView() -> VideoViewController {
        let videoView = VideoViewController()
        let videoModel = VideoModel()
        let presenter = VideoPresenter(view: videoView, model: videoModel)
        
        videoView.setPresenter(presenter: presenter)
        
        return videoView
        
    }
}
