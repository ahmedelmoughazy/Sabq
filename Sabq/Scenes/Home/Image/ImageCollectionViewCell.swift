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
        } else { newsImageView.image =  #imageLiteral(resourceName: "placeholder") }
        self.titleLabel.text = comic.title
        self.timeLabel.text = (comic.publishDate?.convertToLongDate())
  //      setGradientBackground()
    }
    
    func setGradientBackground() {
        let colorTop = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0).cgColor
        let colorBottom = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        newsImageView.layer.addSublayer(gradientLayer)
    }
}
