//
//  ImageCollectionViewCell.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/22/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var videoIconView: UIImageView!
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
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
    func configureCell(comic: Material) {
        if let imageURL = comic.coverPhoto {
            self.newsImageView.sd_setImage(with: URL(string: imageURL),
                                           placeholderImage: #imageLiteral(resourceName: "placeholder") )
        } else {
            newsImageView.image =  #imageLiteral(resourceName: "placeholder")
        }
        
        self.titleLabel.text = comic.title
        self.timeLabel.text = (comic.publishDate?.convertToDate())?.timeAgo()
    }
}
