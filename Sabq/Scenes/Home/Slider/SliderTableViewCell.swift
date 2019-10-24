//
//  SliderTableViewCell.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit

class SliderTableViewCell: UITableViewCell {

    @IBOutlet weak var sliderCollectionView: UICollectionView!
    var sliders:[Material] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        sliderCollectionView.register(SliderCollectionViewCell.nib, forCellWithReuseIdentifier: SliderCollectionViewCell.identifier)
        
        print("registered")
    }

    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

extension SliderTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: UIScreen.main.bounds.width , height: collectionView.frame.height)
    }
}

extension SliderTableViewCell: UICollectionViewDelegate {
    
}

extension SliderTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: SliderCollectionViewCell.identifier, for: indexPath) as? SliderCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(material: sliders[indexPath.row])
        return cell
    }
    
}
