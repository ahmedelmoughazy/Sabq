//
//  HomeAdapter.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation
import UIKit


enum HomeItemType {
    case slider
    case material
    case images
    case videos
    case articles
}

protocol HomeListItem {
    var type: HomeItemType { get }
    var rowCount: Int { get }
}

class HomeAdapter: NSObject, BaseListAdapterProtocal{
    
    typealias DataType = HomeListItem

    internal var list: [HomeListItem]?
    
    var tableView: UITableView?
    
    var reloadData: (() -> Void)?
    var loadMoreData:(() -> Void)?
    
    var showEmptyState: ((Bool) -> Void)?
    
    func setTableView(newsTable: UITableView){

    }
    
    func addSlidersAndMaterials(sliders: [Material],materials: [Material]) {
        if list == nil {
            list = []
        }
        
        if !sliders.isEmpty {
            let slidersItem = SliderListItem(sliders: sliders)
            list?.append(slidersItem)
        }
        
        if !materials.isEmpty {
            let materialsItem = MaterialItem(material: materials)
            list?.append(materialsItem)
        }
        reloadData?()
    }
    
    func addVideos(item: [HomeListItem]) {
        
    }
    
    func addImages(item: HomeListItem) {
        
    }
    
    func addArticles(item: HomeListItem) {
        
    }
    
    func add(item: HomeListItem) {
        
    }
    
    func add(items: [HomeListItem]) {
        if list == nil {
            list = []
        }
        list?.append(contentsOf: items)
        reloadData?()
    }
    
    func update(item: HomeListItem) {
        
    }
    
    func count() -> Int {
        return list?.count ?? 0
    }
    
    func isLastIndex(index: IndexPath) -> Bool {
        return index.row == count()-3
    }
    
    func clear(reload: Bool) {
        switch reload {
        case true:
            list?.removeAll()
            reloadData?()
        default:
            list?.removeAll()
        }
    }
}

extension HomeAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return count()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list![section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = list![indexPath.section]
        
        switch item.type {
        case .slider:
            if let item = item as? SliderListItem, let cell = tableView.dequeueReusableCell(withIdentifier: SliderTableViewCell.identifier, for: indexPath) as? SliderTableViewCell {
                //configure the cell
                return cell
            }
        case .material:
            if let item = item as? MaterialItem, let cell = tableView.dequeueReusableCell(withIdentifier: MaterialTableViewCell.identifier, for: indexPath) as? MaterialTableViewCell {
                cell.title.text = item.material[indexPath.row].title
                //configure the cell
                return cell
            }
        case .images:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as? ImageTableViewCell {
                //configure the cell
                return cell
            }
        case .videos:
            if let cell = tableView.dequeueReusableCell(withIdentifier: MaterialTableViewCell.identifier, for: indexPath) as? MaterialTableViewCell {
                //configure the cell
                return cell
            }
        case .articles:
            if let cell = tableView.dequeueReusableCell(withIdentifier: MaterialTableViewCell.identifier, for: indexPath) as? MaterialTableViewCell {
                //configure the cell
                return cell
            }
        }
        return UITableViewCell()
    }
}

class SliderListItem: HomeListItem {
    var type: HomeItemType {
        return .slider
    }

    var rowCount: Int {
        return 1
    }
    
    var sliders: [Material]
    
    init(sliders: [Material]) {
        self.sliders = sliders
    }
}

class MaterialItem: HomeListItem {
    var type: HomeItemType {
        return .material
    }

    var rowCount: Int {
        return material.count
    }
    
    var material: [Material]
    
    init(material: [Material]) {
        self.material = material
    }
}

//class VideosListItem: HomeListItem {
//    var type: HomeItemType {
//        return .videos
//    }
//
//    var rowCount: Int {
//        return 1
//    }
//
//    var email: String
//
//    init(email: String) {
//        self.email = email
//    }
//}
//
class ImagesListItem: HomeListItem {
    var type: HomeItemType {
        return .images
    }

    var rowCount: Int {
        return 1
    }

    var imageComics: [ImageComic]

    init(imageComics: [ImageComic]) {
        self.imageComics = imageComics
    }
}

//class ArticlesListItem: HomeListItem {
//    var type: HomeItemType {
//        return .articles
//    }
//
//    var rowCount: Int {
//        return attributes.count
//    }
//
//    var attributes: [Attribute]
//
//    init(attributes: [Attribute]) {
//        self.attributes = attributes
//    }
//}
