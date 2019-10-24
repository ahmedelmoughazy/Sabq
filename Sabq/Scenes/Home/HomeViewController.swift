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

    @IBOutlet weak var homeTableView: UITableView! {
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
        "MaterialTableViewCell",
        "MaterialTableViewCell",
        "MaterialTableViewCell",
        "MaterialTableViewCell"
    ]
    
    private func setupLoadingPlaceholderView() {
        loadingPlaceholderView.gradientColor = .white
        loadingPlaceholderView.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeTableView.dataSource = adapter
        homeTableView.delegate = self
        homeTableView.separatorStyle = .none
        
        
        homeTableView.register(ArticleTableViewCell.nib, forCellReuseIdentifier: ArticleTableViewCell.identifier)
        homeTableView.register(VideoTableViewCell.nib, forCellReuseIdentifier: VideoTableViewCell.identifier)
        homeTableView.register(ImageTableViewCell.nib, forCellReuseIdentifier: ImageTableViewCell.identifier)
        homeTableView.register(MaterialTableViewCell.nib, forCellReuseIdentifier: MaterialTableViewCell.identifier)
        homeTableView.register(SliderTableViewCell.nib, forCellReuseIdentifier: SliderTableViewCell.identifier)
        
        adapter.setTableView(newsTable: homeTableView)
        adapter.reloadData = reloadActorsData
        setupLoadingPlaceholderView()
        loadingPlaceholderView.cover(view)
        presenter.loadHome()
    }


    func reloadActorsData(){
        homeTableView.separatorStyle = .singleLine
        homeTableView.reloadData()
    }
    
    func renderViewWithObjects(sliders: [Material], materials: [Material]) {
        adapter.addSlidersAndMaterials(sliders: sliders, materials: materials)
        AMShimmer.stop(for: homeTableView)
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
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UIScreen.main.bounds.height/2
        default:
            switch indexPath.row {
            case 5,11,17:
                return UIScreen.main.bounds.height/2.9
            default:
                return 130
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked on \(indexPath.row)")
        //  PeopleRouter.showDetail(at: self.navigationController!, with: (peoplePresenter?.getPerson(index:indexPath.row))!)
    }
}
