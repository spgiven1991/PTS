//
//  ViewController.swift
//  Post to Shop Redo
//
//  Created by Samuel Given on 6/20/17.
//  Copyright © 2017 Post to Shop. All rights reserved.
//

import UIKit
import Firebase
import LBTAComponents

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let headerId = "headerId"
    let footerId = "footerId"
    
    var myUsers = [myUser]()
    var links = [Link]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(MyCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId)
        
        setupNavigationBarItems()
        checkIfUserIsLoggedIn()
        fetchUser()
        loadLinks()
        
    }
    
    func fetchUser() {
        Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let user = myUser()
                user.id = snapshot.key
                user.setValuesForKeys(dictionary)
                self.myUsers.append(user)
            }
        }, withCancel: nil)
    }
    
    func loadLinks() {
        Database.database().reference().child("link").observe(.childAdded) { (snapshot: DataSnapshot) in
            if let dict = snapshot.value as? [String:Any] {
                let userLinkUrl = dict["userLink"] as! String
                let timestampNumber = dict["timestamp"] as! NSNumber
                let link = Link(userLinkUrl: userLinkUrl, timestampNumber: timestampNumber)
                self.links.append(link)
                self.links.sort(by: { (link1, link2) -> Bool in
                    return (link1.timestamp?.intValue)! > (link2.timestamp?.intValue)!
                })
//                print(self.links)
                DispatchQueue.main.async(execute: { 
                    self.collectionView?.reloadData()
                })
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return links.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCell
        cell.linkLabel.text = links[indexPath.row].userLink
        cell.linkLabel.numberOfLines = 0 
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 270)
    }
   
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
            header.backgroundColor = .blue
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
            footer.backgroundColor = .green
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    // Nav Bar setup. Move to different file
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
//        } else {
//            let uid = Auth.auth().currentUser?.uid
//            Database.database().reference().child("users").child(uid!).observe(.value, with: { (snapshot) in
//                if let dictionary = snapshot.value as? [String: AnyObject] {
//                    self.navigationItem.title = dictionary["name"] as? String
//                }
//                }, withCancel: nil)
//            }
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


