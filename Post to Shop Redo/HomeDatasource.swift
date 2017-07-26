//
//  HomeDatasource.swift
//  Post to Shop Redo
//
//  Created by Samuel Given on 6/21/17.
//  Copyright © 2017 Post to Shop. All rights reserved.
//

import LBTAComponents
//import TRON
//import SwiftyJSON

//extension Collection where Iterator.Element == JSON {
//    func decode<T: JSONDecodable>() throws -> [T] {
//        return try map{try T(json: $0)}
//    }
//}
//
//class HomeDatasource: Datasource {
////
////    var myLinks: [Link] = []
////
//    let myLinks = ["user1", "user2", "user3"]
//    
////    let userProducts: [UserProduct] = {
////        let productOne = UserProduct(product: "Sequin Lace Long Sleeve", price: "$123.00", buy: "You receive $6.50 when you BUY NOW!", productImage: #imageLiteral(resourceName: "product_image"))
////        
////        let productTwo = UserProduct(product: "Blue Button Down", price: "$75.00", buy: "You receive $3.50 when you BUY NOW!", productImage: #imageLiteral(resourceName: "product2"))
////        
////        let productThree = UserProduct(product: "Shoes", price: "$875.00", buy: "You receive $3,500,500,500,500,500.00 when you BUY NOW!", productImage: #imageLiteral(resourceName: "product3"))
////        
////        return [productOne, productTwo, productThree]
////    }()
//    //
//    //    let users: [User]
//    //
//    //    required init(json: JSON) throws {
//    //
//    //        guard let usersJsonArray = json["users"].array, let tweetsJsonArray = json["tweets"].array else {
//    //            throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON was not valid."])
//    //        }
//    //
//    //        self.users = try usersJsonArray.decode()
//    //        self.tweets = try tweetsJsonArray.decode()
//    //
//    //
//    //    }
////    
//    override func footerClasses() -> [DatasourceCell.Type]? {
//        return [UserFooter.self]
//    }
//    
//    override func headerClasses() -> [DatasourceCell.Type]? {
//        return [UserHeader.self]
//    }
//
//    override func cellClasses() -> [DatasourceCell.Type] {
//        return [UserCell.self]
//    }
//    
//    override func item(_ indexPath: IndexPath) -> Any? {
//        return myLinks[indexPath.item]
//    }
//    
//    override func numberOfItems(_ section: Int) -> Int {
//        return myLinks.count
//    }
//}
