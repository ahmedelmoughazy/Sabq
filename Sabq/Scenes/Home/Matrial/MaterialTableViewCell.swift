//
//  MaterialTableViewCell.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit
import SDWebImage
import LocalizedTimeAgo

class MaterialTableViewCell: UITableViewCell {

    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var newsImageView: UIImageView!
    @IBOutlet weak private var timeLabel: UILabel!
    @IBOutlet weak private var viewsLabel: UILabel!
    @IBOutlet weak private var viewsImageView: UIImageView!
    @IBOutlet weak private var videoNewsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func configureCell(material: Material) {
        self.titleLabel.text = material.title
        if let imageURL = material.coverPhoto {
            self.newsImageView.sd_setImage(with: URL(string: imageURL),
                                           placeholderImage: #imageLiteral(resourceName: "placeholder") )
        } else { newsImageView.image =  #imageLiteral(resourceName: "placeholder") }
        self.timeLabel.text = (material.publishDate?.convertToDate())?.timeAgo()
        self.viewsLabel.text = material.noOfViews?.localizedNumber()
        
        guard let noOfVideos = material.videosCount else { return }
        self.videoNewsImageView.isHidden = noOfVideos > 0 ? false : true
        
        guard let noOfViews = material.noOfViews else { return }
        self.viewsImageView.image = noOfViews > 5000 ? #imageLiteral(resourceName: "ic_views_icon_hot") : #imageLiteral(resourceName: "ic_views_icon")
    }
}
