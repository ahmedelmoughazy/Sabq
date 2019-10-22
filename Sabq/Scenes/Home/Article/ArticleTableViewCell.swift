//
//  ArticleTableViewCell.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/21/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    var articles: [Material]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
