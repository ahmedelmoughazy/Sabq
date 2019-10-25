//
//  ImageCollectionViewCell.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/22/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var videoIconView: UIImageView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
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
    
    func configureCell(comic: Material){
        self.newsImageView.sd_setImage(with:
            URL(string: comic.coverPhoto!), placeholderImage: UIImage(named: "placeholder"))
        self.titleLabel.text = comic.title
        self.timeLabel.text = (comic.publishDate?.convertToDate())?.timeAgo()
    }
}
