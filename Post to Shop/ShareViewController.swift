//
//  ShareViewController.swift
//  Post to Shop
//
//  Created by Samuel Given on 6/21/17.
//  Copyright © 2017 Post to Shop. All rights reserved.
//

import UIKit
//import Foundation
import Social
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
import MobileCoreServices

class ShareViewController: SLComposeServiceViewController {
    
    var user: myUser?
    
    private var urlString: String?
    private var schemeString: String?
    private var hostString: String?
    private var pathString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let extensionItem = extensionContext?.inputItems[0] as! NSExtensionItem
        let contentTypeURL = kUTTypeURL as String
        
        for attachment in extensionItem.attachments as! [NSItemProvider] {
            if attachment.isURL {
                attachment.loadItem(forTypeIdentifier: contentTypeURL, options: nil, completionHandler: { (results, error) in
                    let url = results as! URL?
                    self.urlString = url!.absoluteString
                    self.schemeString = url!.scheme
                    self.hostString = url!.host
                    self.pathString = url!.path
                })
            }
        }
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
//        checkIfUserIsLoggedIn()
//        handleLogout()
    }
    
    override func isContentValid() -> Bool {
        
        return true
    }
    
    override func didSelectPost() {
        
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        handlePost()
        
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }
    
    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }
    
//    func checkIfUserIsLoggedIn() {
//        
//        if Auth.auth().currentUser?.uid == nil {
//            perform(#selector(handleLogout), with: nil, afterDelay: 0)
//        }
//        //        } else {
//        //            let uid = Auth.auth().currentUser?.uid
//        //            Database.database().reference().child("users").child(uid!).observe(.value, with: { (snapshot) in
//        //                    print(snapshot)
//        //                }, withCancel: nil)
//        //            }
//    }
    
//    func handleLogout() {
//        
//        do {
//            try Auth.auth().signOut()
//        } catch let logoutError {
//            print(logoutError)
//        }
////        
////        let loginController = LoginController()
////        present(loginController, animated: true, completion: nil)
//    }
    
    func handlePost() {
        let ref = Database.database().reference().child("link")
        let childRef = ref.childByAutoId()
        let userId = "HELP"
        let timestamp = NSDate().timeIntervalSince1970
        let values = ["userLink": urlString!, "scheme": schemeString!, "host": hostString!, "path": pathString!, "userId": userId, "timestamp": timestamp] as [String : Any]
        childRef.updateChildValues(values)
    }
    
}

extension NSItemProvider {
    
    var isURL: Bool {
        return hasItemConformingToTypeIdentifier(kUTTypeURL as String)
    }
}











