//
//  DetailsViewController.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/24/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit

class DetailsViewController: BaseViewController<DetailsPresenter>, DetailsViewProtocol {

    @IBOutlet private weak var innerSubtitle: UILabel!
    @IBOutlet private weak var tilteLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var followSubjectLabel: UIButton!
    @IBOutlet private weak var areaLabel: UIButton!
    @IBOutlet private weak var coverPhotoImageView: UIImageView!
    @IBOutlet private weak var autherNameLabel: UILabel!
    @IBOutlet private weak var autherImageView: UIImageView!
    @IBOutlet private weak var viewsButton: UIButton!
    @IBOutlet private weak var likesButton: UIButton!
    @IBOutlet private weak var commentsButton: UIButton!
    @IBOutlet private weak var limitLabel: UILabel!
    @IBOutlet private weak var autherCity: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.loadDetailsData()
    }

    func renderViewWithObject(material: Material) {
        descriptionLabel.isHidden = true
        
    }
}
