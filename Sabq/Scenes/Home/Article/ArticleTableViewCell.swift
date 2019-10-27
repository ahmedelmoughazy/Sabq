//
//  ArticleTableViewCell.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/21/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet private weak var articlesCollectionView: UICollectionView!
    private var articles: [Material]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        articlesCollectionView.delegate = self
        articlesCollectionView.dataSource = self
        articlesCollectionView.register(ArticleCollectionViewCell.nib,
                                        forCellWithReuseIdentifier: ArticleCollectionViewCell.identifier)
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func configureCell(articles: [Material]) {
        self.articles = articles
    }
}

extension ArticleTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height , height: collectionView.frame.height)
    }
}

extension ArticleTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NewsRouter.moveToDetails(material: articles![indexPath.row])
    }
}

extension ArticleTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles!.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ArticleCollectionViewCell.identifier,
            for: indexPath) as? ArticleCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(material: articles![indexPath.row])
        return cell
    }
}
