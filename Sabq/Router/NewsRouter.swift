//
//  PeopleRouter.swift
//  Movies
//
//  Created by Ahmed Refaat on 9/16/19.
//  Copyright © 2019 Ahmed Elmoughazy. All rights reserved.
//

import UIKit

class NewsRouter {
    
    private static var window: UIWindow?
    private static var homeNavigationController: UINavigationController?
    private static var loginNavigationController: UINavigationController?
    private static var tabbarController: UITabBarController?
    
    class func startRouting(at window: UIWindow?) {
        
        //setup tabbar icons
        let bookmarksItem = UITabBarItem(title: NSLocalizedString("Bookmarks", comment: "tabbar item title"),
                                         image: #imageLiteral(resourceName: "ic_save"),
                                         selectedImage: #imageLiteral(resourceName: "ic_save") )
        let sectionsItem = UITabBarItem(title: NSLocalizedString("Sections", comment: "tabbar item title"),
                                        image: #imageLiteral(resourceName: "ic_list"),
                                        selectedImage: #imageLiteral(resourceName: "ic_list"))
        let commonItem = UITabBarItem(title: NSLocalizedString("Common", comment: "tabbar item title"),
                                      image: #imageLiteral(resourceName: "ic_star"),
                                      selectedImage: #imageLiteral(resourceName: "ic_star"))
        let searchItem = UITabBarItem(title: NSLocalizedString("Search", comment: "tabbar item title"),
                                      image: #imageLiteral(resourceName: "ic_search"),
                                      selectedImage: #imageLiteral(resourceName: "ic_search") )
        let homeItem = UITabBarItem(title: NSLocalizedString("Home", comment: "tabbar item title"),
                                    image: #imageLiteral(resourceName: "ic_newspaper_active"),
                                    selectedImage: #imageLiteral(resourceName: "ic_newspaper_active") )
        
        //setup viewcontrollers
        let loginViewController = LoginViewController()
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
        guard let homeNavigationController = self.homeNavigationController else { return }

        //setup tabbar
        self.tabbarController = UITabBarController()
        self.tabbarController?.viewControllers = [ homeNavigationController,
                                                   commonViewController,
                                                   sectionsViewController,
                                                   searchViewController,
                                                   bookmarksViewController]
        self.tabbarController?.tabBar.barTintColor = UIColor(named: "color-background")
        self.tabbarController?.tabBar.isTranslucent = false
        
        self.loginNavigationController = UINavigationController(rootViewController: loginViewController)
        
        guard let loginNavigationController = self.loginNavigationController else { return }
        
        window?.rootViewController = loginNavigationController
        window?.makeKeyAndVisible()
    }

    class func moveToDetails(material: Material) {
        let detailsViewController = DetailsModule.getDetailsView(material: material)
        homeNavigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    class func moveToVideoView(material: Material) {
        let videoViewController = VideoModule.getVideoView(material: material)
        tabbarController?.tabBar.isHidden = true
        homeNavigationController?.pushViewController(videoViewController, animated: true)
    }
    
    class func moveToApplication() {
        guard let tabbarController = self.tabbarController else { return }
        loginNavigationController?.setViewControllers([tabbarController], animated: true)
    }
    
//    class func setRTL() {
//        UIView.appearance().semanticContentAttribute = .forceRightToLeft
//        UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft
//    }
}
