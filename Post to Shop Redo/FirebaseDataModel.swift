//
//  CoreDataStack.swift
//  Post to Shop Redo
//
//  Created by Samuel Given on 6/22/17.
//  Copyright © 2017 Post to Shop. All rights reserved.
//

import Foundation
import Firebase
//import CoreData

//class FirebaseDataModel {
//    
//    var dataKey = "Data"
//    
//    var link = [String]()
//    var firebaseReference: DatabaseReference
//    
//    init() {
//        FirebaseApp.configure()
//        firebaseReference = Database.database().reference()
//        setObservers()
//        
//    }
//    
//    func setObservers() {
//        firebaseReference.child("link").observe(DataEventType.value, with: {
//            (snapshot) in
//            
//            self.link = [String]()
//            
//            let children = snapshot.children
//            while let child = children.nextObject() as? DataSnapshot {
//                self.link.append(child.value as! String)
//            }
//            
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refresh"), object: nil)
//        })
//    }
//    
//}

//class CustomPersistentContainer: NSPersistentContainer {
//    static let url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.PosttoShop.Post-to-Shop-Redo")!
//    let storeDescription = NSPersistentStoreDescription(url: url)
//    
//    override class func defaultDirectoryURL() -> URL {
//        return url
//    }
//}
