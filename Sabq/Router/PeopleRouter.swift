//
//  PeopleRouter.swift
//  Movies
//
//  Created by Ahmed Refaat on 9/16/19.
//  Copyright © 2019 Ahmed Elmoughazy. All rights reserved.
//

import UIKit

class PeopleRouter {
    
    class func present(at window: UIWindow?) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let peopleViewController = storyBoard.instantiateViewController(withIdentifier: "PeopleViewController")
            as! PeopleViewController
        peopleViewController.attachPresenter()
        
        let uploadImageViewController = storyBoard.instantiateViewController(withIdentifier: "UploadImageViewController")
            as! UploadImageViewController
        
        
        let navigation = storyBoard.instantiateViewController(withIdentifier: "navigation") as! UINavigationController
        navigation.pushViewController(peopleViewController, animated: true)
        
        let tabBarController = storyBoard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        
        tabBarController.viewControllers = [navigation,uploadImageViewController]
        
        window?.rootViewController = tabBarController

    }
    
    class func showDetail(at parent: UINavigationController,with model: Person) {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let profileViewController = (storyBoard.instantiateViewController(withIdentifier: "profileVC")
            as! ProfileCollectionViewController)
        profileViewController.profilePresenter = ProfilePresenter(profileView: profileViewController, profileService: ProfileService(person: model))
        
        parent.pushViewController(profileViewController, animated: true)
    }
    
    class func showDownloadView(at parent: UINavigationController,with url: String) {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let downloadImageViewController =
            (storyBoard.instantiateViewController(withIdentifier: "DownloadImageViewController")
                as! DownloadImageViewController)
        
        downloadImageViewController.presenter =
            ImageDownloadPresenter(imageDownloadView: downloadImageViewController,
                                   imageDownloadService: ImageDownloadService(url: url))
        
        parent.pushViewController(downloadImageViewController, animated: true)
    }
}
