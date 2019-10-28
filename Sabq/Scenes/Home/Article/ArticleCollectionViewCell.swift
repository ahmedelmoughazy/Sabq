//
//  ArticleCollectionViewCell.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/23/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var autherImageView: UIImageView!
    @IBOutlet private weak var autherNameLabel: UILabel!
    
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
        self.autherImageView.layer.cornerRadius = self.autherImageView.frame.size.width / 2.0
        if let imageURL = material.authorImg {
            self.autherImageView.sd_setImage(with: URL(string: imageURL),
                                             placeholderImage: #imageLiteral(resourceName: "placeholder") )
        } else { autherImageView.image =  #imageLiteral(resourceName: "placeholder") }
        self.titleLabel.text = material.title
        self.autherNameLabel.text = material.authorName
    }
}
