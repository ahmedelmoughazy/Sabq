//
//  VideoTableViewCell.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    @IBOutlet private weak var videosCollectionView: UICollectionView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var moreLabel: UILabel!
    private var videos: [Material]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.titleLabel.text = NSLocalizedString("Videos", comment: "section title")
        self.moreLabel.text = NSLocalizedString("More", comment: "section title")
        
        videosCollectionView.delegate = self
        videosCollectionView.dataSource = self
        videosCollectionView.register(VideoCollectionViewCell.nib,
                                      forCellWithReuseIdentifier: VideoCollectionViewCell.identifier)
    }
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier: String {
        return String(describing: self)
    }
    func configureCell(videos: [Material]) {
        self.videos = videos
    }
}

extension VideoTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 3, height: collectionView.frame.height)
    }
}

extension VideoTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let videoMaterial = videos?[indexPath.row] else { return }
        NewsRouter.moveToVideoView(material: videoMaterial)
    }
}

extension VideoTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            guard let _ = videos?.count else { return 0 }
            return 0
    }
        
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: VideoCollectionViewCell.identifier,
            for: indexPath) as? VideoCollectionViewCell,
            let videoMaterial = videos?[indexPath.row] else { return UICollectionViewCell() }
        cell.configureCell(comic: videoMaterial)
        return cell
    }
}
