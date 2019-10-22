//
//  VideoTableViewCell.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var videosCollectionView: UICollectionView!
    
    var videos: [Material]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        videosCollectionView.delegate = self
        videosCollectionView.dataSource = self
        videosCollectionView.register(VideoCollectionViewCell.nib, forCellWithReuseIdentifier: VideoCollectionViewCell.identifier)
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

extension VideoTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width , height: collectionView.frame.height)
    }
}

extension VideoTableViewCell: UICollectionViewDelegate {
    
}

extension VideoTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderCollectionViewCell.identifier, for: indexPath) as? SliderCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(material: videos![indexPath.row])
        return cell
    }
    
}
