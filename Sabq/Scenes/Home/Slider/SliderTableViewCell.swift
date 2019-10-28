//
//  SliderTableViewCell.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialPageControl

class SliderTableViewCell: UITableViewCell {
    @IBOutlet private weak var sliderCollectionView: UICollectionView!
    @IBOutlet private weak var shimmerView: UIView!
    private let pageControl = MDCPageControl()
    private var sliders: [Material] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        sliderCollectionView.register(SliderCollectionViewCell.nib,
                                      forCellWithReuseIdentifier: SliderCollectionViewCell.identifier)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func configureCell(sliders: [Material]) {
        self.shimmerView.isHidden = true
        self.sliders.removeAll()
        self.sliders.append(contentsOf: sliders)
        self.setupPageControl()
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = sliders.count
        pageControl.hidesForSinglePage = true
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8862745098, alpha: 1)
        let pageControlSize = pageControl.sizeThatFits(self.bounds.size)
        pageControl.frame = CGRect(x: 0, y: self.bounds.height / 2 - pageControlSize.height,
                                   width: self.bounds.width, height: pageControlSize.height)
        self.addSubview(pageControl)
    }
}

extension SliderTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: collectionView.frame.height)
    }
}

extension SliderTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.section
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NewsRouter.moveToDetails(material: sliders[indexPath.row])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.scrollViewDidScroll(scrollView)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.scrollViewDidEndDecelerating(scrollView)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl.scrollViewDidEndScrollingAnimation(scrollView)
    }
}

extension SliderTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliders.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = sliderCollectionView.dequeueReusableCell(
            withReuseIdentifier: SliderCollectionViewCell.identifier, for: indexPath)
            as? SliderCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(material: sliders[indexPath.row])
        return cell
    }
    
}
