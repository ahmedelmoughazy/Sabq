//
//  SearchViewController.swift
//  Sabq
//
//  Created by AhmedElmoughazy on 10/23/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController<SearchPresenter>, SearchViewProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
    }
}
