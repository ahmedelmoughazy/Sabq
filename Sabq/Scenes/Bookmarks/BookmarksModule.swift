//
//  BookmarksModule.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class BookmarksModule {
    class func getBookmarksView() -> BookmarksViewController {
        let bookmarksView = BookmarksViewController()
        let bookmarksModel = BookmarksModel()
        let presenter = BookmarksPresenter(view: bookmarksView, model: bookmarksModel)
        
        bookmarksView.setPresenter(presenter: presenter)
        
        return bookmarksView
        
    }
}
