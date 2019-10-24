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
    case material
    case images
    case videos
    case articles
}

protocol HomeListItem {
    var type: HomeItemType { get }
}

class HomeAdapter: NSObject, BaseListAdapterProtocal{
    
    typealias DataType = HomeListItem
    
    internal var list: [HomeListItem]?
    var slider = [SliderListItem]()
    
    var tableView: UITableView?
    var reloadData: (() -> Void)?
    var loadMoreData:(() -> Void)?
    var showEmptyState: ((Bool) -> Void)?
    
    func setTableView(newsTable: UITableView){
        self.tableView = newsTable
    }
    
    func addSlidersAndMaterials(sliders: [Material],materials: [Material]) {
        if list == nil {
            list = []
        }
        
        if !sliders.isEmpty {
            let slidersItem = SliderListItem(sliders: sliders)
            slider.append(slidersItem)
        }
        
        if !materials.isEmpty {
            for material in materials {
                let materialsItem = MaterialItem(material: material)
                list?.append(materialsItem)
            }
        }
        reloadData?()
    }
    
    func addVideos(items: [Material]) {
        if !items.isEmpty {
            let materialsItem = VideosListItem(videos: items)
            list?.insert(materialsItem, at: 5)
        }
        reloadData?()
    }
    
    func addImages(items: [Material]) {
        if !items.isEmpty {
            let materialsItem = ImagesListItem(images: items)
            list?.insert(materialsItem, at: 11)
        }
        reloadData?()
    }
    
    func addArticles(items: [Material]) {
        if !items.isEmpty {
            let materialsItem = ArticlesListItem(articles: items)
            list?.insert(materialsItem, at: 17)
        }
        reloadData?()
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
    
    func getItem(at index: Int) -> Material? {
        if let item = list![index] as? MaterialItem {
            //configure the cell
            return item.material
        } else {
            return nil
        }
        
    }
    func count() -> Int {
        return list?.count ?? 0
    }
    
    func isLastIndex(index: IndexPath) -> Bool {
        return index.row == count()-1
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return slider.count
        default:
            return count()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        let item = list![indexPath.row]
        
        switch section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SliderTableViewCell.identifier, for: indexPath) as? SliderTableViewCell {
                //configure the cell
                cell.configureCell(sliders: slider[indexPath.row].sliders) 
                return cell
            }
        default:
            switch item.type {
            case .material:
                if let item = item as? MaterialItem, let cell = tableView.dequeueReusableCell(withIdentifier: MaterialTableViewCell.identifier, for: indexPath) as? MaterialTableViewCell {
                    //configure the cell
                    cell.configureCell(material: item.material)
                    return cell
                }
            case .images:
                if let item = item as? ImagesListItem, let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as? ImageTableViewCell {
                    //configure the cell
                    cell.images = item.images
                    return cell
                }
            case .videos:
                if let item = item as? VideosListItem, let cell = tableView.dequeueReusableCell(withIdentifier: VideoTableViewCell.identifier, for: indexPath) as? VideoTableViewCell {
                    //configure the cell
                    cell.videos = item.videos
                    return cell
                }
            case .articles:
                if let item = item as? ArticlesListItem, let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as? ArticleTableViewCell {
                    //configure the cell
                    cell.articles = item.articles
                    return cell
                }
            }
        }
        
        
        return UITableViewCell()
    }
}

class SliderListItem{
    
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
    
    var material: Material
    
    init(material: Material) {
        self.material = material
    }
}

class VideosListItem: HomeListItem {
    var type: HomeItemType {
        return .videos
    }
    
    var videos: [Material]
    
    init(videos: [Material]) {
        self.videos = videos
    }
}

class ImagesListItem: HomeListItem {
    var type: HomeItemType {
        return .images
    }
    
    var rowCount: Int {
        return 1
    }
    
    var images: [Material]
    
    init(images: [Material]) {
        self.images = images
    }
}

class ArticlesListItem: HomeListItem {
    var type: HomeItemType {
        return .articles
    }
    
    var articles: [Material]
    
    init(articles: [Material]) {
        self.articles = articles
    }
}
