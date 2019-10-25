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
    
    func configureCell(material: Material){
        self.titleLabel.text = material.title
        self.newsImageView.sd_setImage(with:
            URL(string: material.coverPhoto!), placeholderImage: UIImage(named: "placeholder"))
        self.timeLabel.text = (material.publishDate?.convertToDate())?.timeAgo()
        self.viewsImageView.image = material.noOfViews! > 5000 ? UIImage(named: "ic_views_icon_hot"): UIImage(named: "ic_views_icon")
        self.viewsLabel.text = material.noOfViews?.localizedNumber()
    }
}
