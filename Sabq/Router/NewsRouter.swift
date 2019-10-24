//
//  PeopleRouter.swift
//  Movies
//
//  Created by Ahmed Refaat on 9/16/19.
//  Copyright © 2019 Ahmed Elmoughazy. All rights reserved.
//

import UIKit

class NewsRouter {
    
    private static var window : UIWindow?
    private static var homeNavigationController : UINavigationController?
    private static var tabbarController : UITabBarController?
    
    class func startRouting(at window: UIWindow?) {
        
        //setup tabbar icons
        let bookmarksItem = UITabBarItem(title: "Bookmarks", image: UIImage(named: "ic_bookmark"), selectedImage: UIImage(named: "ic_bookmark"))
        let sectionsItem = UITabBarItem(title: "Sections", image: UIImage(named: "ic_list"), selectedImage: UIImage(named: "ic_list"))
        let commonItem = UITabBarItem(title: "Common", image: UIImage(named: "ic_star"), selectedImage: UIImage(named: "ic_star_active"))
        let searchItem = UITabBarItem(title: "Search", image: UIImage(named: "ic_search"), selectedImage: UIImage(named: "ic_search"))
        let homeItem = UITabBarItem(title: "Home", image: UIImage(named: "ic_newspaper_active"), selectedImage: UIImage(named: "ic_newspaper_active"))
        
        //setup viewcontrollers
        let bookmarksViewController = BookmarksModule.getBookmarksView()
        let sectionsViewController = SectionsModule.getSectionsView()
        let commonViewController = CommonModule.getCommonView()
        let searchViewController = SearchModule.getSearchView()
        let homeViewController = HomeModule.getHomeView()
        
        bookmarksViewController.tabBarItem = bookmarksItem
        sectionsViewController.tabBarItem = sectionsItem
        commonViewController.tabBarItem = commonItem
        searchViewController.tabBarItem = searchItem
        homeViewController.tabBarItem = homeItem
        
        self.homeNavigationController = UINavigationController(rootViewController: homeViewController)
        
        //setup tabbar
        self.tabbarController = UITabBarController()
        self.tabbarController?.viewControllers = [ homeNavigationController!, commonViewController, sectionsViewController, searchViewController, bookmarksViewController]

        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
    }

    class func setRTL() {
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
        UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft
    }
}
