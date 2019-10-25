//
//  BookmarksViewController.swift
//  Sabq
//
//  Created by AhmedElmoughazy on 10/23/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit

class BookmarksViewController: BaseViewController<BookmarksPresenter>, BookmarksViewProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Bookmarks", comment: "tabbar item title")
    }
    
}
