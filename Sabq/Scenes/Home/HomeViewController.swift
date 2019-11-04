//
//  HomeViewController.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit
import LoadingPlaceholderView

class HomeViewController: BaseViewController<HomePresenter>, HomeViewProtocol {

    @IBOutlet private weak var homeTableView: UITableView! {
        didSet {
            homeTableView.coverableCellsIdentifiers = cellsIdentifiers
        }
    }
    private var adapter = HomeAdapter()
    private var loadingPlaceholderView = LoadingPlaceholderView()
    private var cellsIdentifiers = [
        "SliderTableViewCell",
        "MaterialTableViewCell",
        "MaterialTableViewCell",
        "MaterialTableViewCell"
    ]
    
    private func setupLoadingPlaceholderView() {
        guard let backgroundColor = UIColor(named: "shimmer-color"),
            let colorAccent = UIColor(named: "shimmer-gredient") else { return }
        
        loadingPlaceholderView.gradientColor = colorAccent
        loadingPlaceholderView.backgroundColor = backgroundColor
        loadingPlaceholderView.cover(view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeTableView.dataSource = adapter
        homeTableView.delegate = self
        homeTableView.separatorStyle = .none
        
        homeTableView.register(ArticleTableViewCell.nib,
                               forCellReuseIdentifier: ArticleTableViewCell.identifier)
        homeTableView.register(VideoTableViewCell.nib,
                               forCellReuseIdentifier: VideoTableViewCell.identifier)
        homeTableView.register(ImageTableViewCell.nib,
                               forCellReuseIdentifier: ImageTableViewCell.identifier)
        homeTableView.register(MaterialTableViewCell.nib,
                               forCellReuseIdentifier: MaterialTableViewCell.identifier)
        homeTableView.register(SliderTableViewCell.nib,
                               forCellReuseIdentifier: SliderTableViewCell.identifier)
        
        homeTableView.refreshControl = UIRefreshControl()
        guard let refreshControl = homeTableView.refreshControl else { return }
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: NSLocalizedString("Pull to refresh",
                                                                                      comment: "Pull to refresh"))
        
        adapter.setTableView(newsTable: homeTableView)
        adapter.reloadData = reloadActorsData
        
        setupLoadingPlaceholderView()
        presenter.loadHome()
    }

    @objc
    func refresh() {
//        adapter.clear(reload: true)
//        homeTableView.separatorStyle = .none
//        setupLoadingPlaceholderView()
//        presenter.loadHome()
    }
    
    func reloadActorsData() {
        homeTableView.separatorStyle = .singleLine
        homeTableView.reloadData()
        homeTableView.refreshControl?.endRefreshing()
    }
    
    func renderViewWithObjects(sliders: [Material], materials: [Material]) {
        adapter.addSlidersAndMaterials(sliders: sliders, materials: materials)
        loadingPlaceholderView.uncover()
        presenter.loadVideos()
    }
    
    func renderViewWithObjects(images: [Material]) {
        adapter.addImages(items: images)
        presenter.loadArticles()
    }
    
    func renderViewWithObjects(videos: [Material]) {
        adapter.addVideos(items: videos)
        presenter.loadImages()
    }
    
    func renderViewWithObjects(articles: [Material]) {
        adapter.addArticles(items: articles)
    }

    func renderEmptyView() {
        loadingPlaceholderView.uncover()
        homeTableView.setEmptyView(title: NSLocalizedString("No Internet Title", comment: "No Internet Title"),
                                   message: NSLocalizedString("No Internet Message", comment: "No Internet Message"),
                                   messageImage: #imageLiteral(resourceName: "no-internet"))
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UIScreen.main.bounds.height / 2
        default:
            switch indexPath.row {
            case 5, 11, 17:
                return UIScreen.main.bounds.height / 2.9
            default:
                return 130
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = adapter.getItem(at: indexPath.row) {
            NewsRouter.moveToDetails(material: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
