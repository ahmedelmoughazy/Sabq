//
//  ArticleCollectionViewCell.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/23/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var autherImageView: UIImageView!
    @IBOutlet weak var autherNameLabel: UILabel!
    
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
        self.autherImageView.layer.cornerRadius = self.autherImageView.frame.size.width / 2.0
        self.autherImageView.sd_setImage(with:
            URL(string: material.authorImg!), placeholderImage: UIImage(named: "img_news_img_1"))
        self.titleLabel.text = material.title
        self.autherNameLabel.text = material.authorName
    }
}
