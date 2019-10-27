//
//  SliderCollectionViewCell.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/21/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit
import Foundation

class SliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var newsImageView: UIImageView!
    @IBOutlet weak private var timeLabel: UILabel!
    @IBOutlet weak private var viewsLabel: UILabel!
    @IBOutlet weak private var viewsImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        newsImageView.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                          height: (UIScreen.main.bounds.height)/4)
    }

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func configureCell(material: Material) {
        self.titleLabel.text = material.title
        self.descriptionLabel.text = material.description!.replacingOccurrences(of: "<[^>]+>",
                                                                                with: "",
                                                                                options: .regularExpression,
                                                                                range: nil)
        self.newsImageView.sd_setImage(with: URL(string: material.coverPhoto!),
                                       placeholderImage: UIImage(named: "placeholder"))
        self.timeLabel.text = (material.publishDate?.convertToDate())?.timeAgo()
        self.viewsImageView.image = material.noOfViews! > 5000 ? UIImage(
            named: "ic_views_icon_hot"): UIImage(named: "ic_views_icon")
        self.viewsLabel.text = material.noOfViews?.localizedNumber()
    }
}
