//
//  HomeDatasourceController+navbar.swift
//  Post to Shop Redo
//
//  Created by Samuel Given on 6/21/17.
//  Copyright © 2017 Post to Shop. All rights reserved.
//

import UIKit
import Firebase

extension HomeDatasourceController {
    
    func setupNavigationBarItems() {
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "Post_to_Shop"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 75, height: 30)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        //
        //        let dollarButton = UIButton(type: .system)
        //        dollarButton.setTitle("$37.40", for: .normal)
        //        dollarButton.frame = CGRect(x: 0, y: 0, width: 72, height: 30)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "$37.40", style: .plain, target: self, action: #selector(handleCashOut))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
    }
    
    func handleCashOut() {
        let accountController = AccountController()
        let navController = UINavigationController(rootViewController: accountController)
        present(navController, animated: true, completion: nil)
    }
    
    func checkIfUserIsLoggedIn() {
        
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        }
        //        else {
        //            let uid = Auth.auth().currentUser?.uid
        //            Database.database().reference().child("users").child(uid!).observe(.value, with: { (snapshot) in
        //                print(snapshot)
        //            }, withCancel: nil)
        //        }
    }
    
    func handleLogout() {
        
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
}

