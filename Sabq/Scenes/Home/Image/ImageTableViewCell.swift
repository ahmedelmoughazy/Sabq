//
//  ImageTableViewCell.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    var images: [Material]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        imagesCollectionView.register(ImageCollectionViewCell.nib, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

extension ImageTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height , height: collectionView.frame.height)
    }
}

extension ImageTableViewCell: UICollectionViewDelegate {
    
}

extension ImageTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(comic: images![indexPath.row])
        return cell
    }
    
}
