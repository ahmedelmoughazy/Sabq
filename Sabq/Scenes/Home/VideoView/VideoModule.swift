//
//  VideoModule.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation
import UIKit

class VideoModule {
    class func getVideoView(material: Material) -> VideoViewController {
        let videoView = VideoViewController()
        let videoModel = VideoModel(material: material)
        let presenter = VideoPresenter(view: videoView, model: videoModel)
        
        var shareIcon = #imageLiteral(resourceName: "ic_share-arrow")
        shareIcon = shareIcon.withRenderingMode(.alwaysOriginal)
        
        videoView.navigationItem.rightBarButtonItem = UIBarButtonItem(image: shareIcon,
                                                                      style: .plain,
                                                                      target: nil,
                                                                      action: nil)
        
        videoView.setPresenter(presenter: presenter)
        
        return videoView
        
    }
}
