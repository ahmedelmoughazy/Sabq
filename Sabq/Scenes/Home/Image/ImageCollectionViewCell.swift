//
//  ImageCollectionViewCell.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/22/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }

    func configureCell(comic: Material) {
        self.newsImageView.sd_setImage(with:
            URL(string: comic.coverPhoto!), placeholderImage: UIImage(named: "placeholder"))
        self.titleLabel.text = comic.title
        self.timeLabel.text = (comic.publishDate?.convertToDate())?.timeAgo()
    }
}
