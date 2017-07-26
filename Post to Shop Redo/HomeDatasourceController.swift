//
//  HomeDatasourceController.swift
//  Post to Shop Redo
//
//  Created by Samuel Given on 6/21/17.
//  Copyright © 2017 Post to Shop. All rights reserved.
//

//import LBTAComponents
////import SwiftyJSON
//import Firebase
//
//class HomeDatasourceController: DatasourceController {
//    
//    var links: [Link] = []
//    
//    let coreStack = CoreDataStack.store
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        NotificationCenter.default.addObserver(forName: Notification.Name.UIApplicationWillEnterForeground, object: nil, queue: nil, using: reload)
//        
//        let homeDatasource = HomeDatasource()
//        self.datasource = homeDatasource
//        
//        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
//        
//        setupNavigationBarItems()
//        checkIfUserIsLoggedIn()
//        
//    }
//    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        coreStack.fetchLinks()
//        links = coreStack.fetchedLinks
//        collectionView?.reloadData()
//    }
//    
//    func reload(notification: Notification) {
//        self.coreStack.fetchLinks()
//        self.links = self.coreStack.fetchedLinks
//        self.collectionView?.reloadData()
//    }
//    
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
////        return 0
////    }
////    
////    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        
////        if let userProduct = self.datasource?.item(indexPath) as? UserProduct {
////            
////            let approximateWidthOfBuyLabel = view.frame.width - 40 - 40 - 10 - 2
////            let size = CGSize(width: approximateWidthOfBuyLabel, height: 1000)
////            let attributes = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)]
////            
////            let estimatedFrame = NSString(string: userProduct.buy).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
////            
////            return CGSize(width: view.frame.width, height: estimatedFrame.height + 260)
////        }
////        
////        return CGSize(width: view.frame.width, height: 60)
////    }
////    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        
//        return CGSize(width: view.frame.width, height: 50)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        
//        return CGSize(width: view.frame.width, height: 64)
//    }
//
//}
