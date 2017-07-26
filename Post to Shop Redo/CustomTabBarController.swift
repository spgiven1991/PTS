//
//  CustomTabBarController.swift
//  Post to Shop Redo
//
//  Created by Samuel Given on 6/21/17.
//  Copyright © 2017 Post to Shop. All rights reserved.
//

import UIKit
import LBTAComponents

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        https://www.iconfinder.com/search/?q=store&price=free
        //        let homeController = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        //        let homeViewController = UINavigationController(rootViewController: homeController)
//        let navViewController = UINavigationController(rootViewController: HomeDatasourceController())
        let redoIC = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        let navViewController = UINavigationController(rootViewController: redoIC)
        navViewController.title = "My Clothes"
        navViewController.tabBarItem.image = #imageLiteral(resourceName: "MyClothes")
        
//        let mainView = InitialVC()
        let brandsController = BrandsController()
//        let redoIC = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        let secondNavigationController = UINavigationController(rootViewController: brandsController)
        secondNavigationController.title = "Brands"
        secondNavigationController.tabBarItem.image = #imageLiteral(resourceName: "Brands")
        
        let accountController = AccountController()
        let thirdNavigationController = UINavigationController(rootViewController: accountController)
        thirdNavigationController.title = "Account"
        thirdNavigationController.tabBarItem.image = #imageLiteral(resourceName: "Account")
        
        viewControllers = [navViewController, secondNavigationController, thirdNavigationController]
        
        tabBar.isTranslucent = false
    }
}
