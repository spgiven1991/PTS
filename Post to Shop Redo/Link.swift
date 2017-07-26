//
//  UserProduct.swift
//  Post to Shop Redo
//
//  Created by Samuel Given on 6/21/17.
//  Copyright © 2017 Post to Shop. All rights reserved.
//

import Foundation
//import SwiftyJSON
//import TRON

class Link {
    var userLink: String
    var timestamp: NSNumber?
    
    init(userLinkUrl: String, timestampNumber: NSNumber) {
        userLink = userLinkUrl
        timestamp = timestampNumber
    }
}

//struct UserProduct {
//    let product: String
//    let price: String
//    let buy: String
//    let productImage: UIImage
    //
    //    init(json: JSON) {
    //        self.name = json["name"].stringValue
    //        self.username = json["username"].stringValue
    //        self.bioText = json["bio"].stringValue
    //        self.profileImageUrl = json["profileImageUrl"].stringValue
    //    }
//}
//
//struct UserLink {
//    let myLink: String
//}
