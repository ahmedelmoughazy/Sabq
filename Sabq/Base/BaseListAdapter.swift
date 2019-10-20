//
//  BaseListAdapter.swift
//  Sabq
//
//  Created by AhmedElmoughazy on 10/18/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

protocol BaseListAdapterProtocal:class {
    associatedtype DataType

    var list: [DataType]? { get set}
    
    var reloadData:(() -> Void)? { get set}
    var loadMoreData:(() -> Void)? { get set}
    
    var showEmptyState: ((Bool) -> Void)? { get set}
    
    func add(item: DataType)
    func add(items: [DataType])
    func update(item: DataType)
    func count() -> Int
    func isLastIndex(index: IndexPath) -> Bool
    func clear(reload: Bool)
}
