//
//  BookmarksPresenter.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class BookmarksPresenter: BookmarksPresenterProtocol{
    
    private var bookmarksView: BookmarksViewProtocol
    private var bookmarksModel: BookmarksModelProtocol

    required init(view: BookmarksViewProtocol, model: BookmarksModelProtocol) {
        bookmarksView = view
        bookmarksModel = model
    }
    
    
}
