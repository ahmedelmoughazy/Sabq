//
//  HomeViewController.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<HomePresenter>, HomeViewProtocol {

    @IBOutlet weak var homeTableView: UITableView!
    private var adapter = HomeAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeTableView.dataSource = adapter
        homeTableView.delegate = self
        homeTableView.separatorStyle = .none
        
        homeTableView.register(VideoTableViewCell.nib, forCellReuseIdentifier: VideoTableViewCell.identifier)
        homeTableView.register(ImageTableViewCell.nib, forCellReuseIdentifier: ImageTableViewCell.identifier)
        homeTableView.register(MaterialTableViewCell.nib, forCellReuseIdentifier: MaterialTableViewCell.identifier)
        homeTableView.register(SliderTableViewCell.nib, forCellReuseIdentifier: SliderTableViewCell.identifier)
        
        adapter.setTableView(newsTable: homeTableView)
        adapter.reloadData = reloadActorsData
        presenter.loadHome()
    }

    func reloadActorsData(){
        homeTableView.separatorStyle = .singleLine
        homeTableView.reloadData()
    }
    
    func renderViewWithObjects(sliders: [Material], materials: [Material]) {
        adapter.addSlidersAndMaterials(sliders: sliders, materials: materials)
        print("data is in view")
    }
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked on \(indexPath.row)")
        //  PeopleRouter.showDetail(at: self.navigationController!, with: (peoplePresenter?.getPerson(index:indexPath.row))!)
    }
}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
