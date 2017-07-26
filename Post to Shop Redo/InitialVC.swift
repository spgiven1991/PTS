//
//  InitialVC.swift
//  Post to Shop Redo
//
//  Created by Samuel Given on 6/23/17.
//  Copyright © 2017 Post to Shop. All rights reserved.
//

//import UIKit
//import Firebase
//
//class MyCell: UICollectionViewCell {
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//
//    let linkLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    var myLink: Link? {
//        didSet {
//            linkLabel.text = myLink?.title
//        }
//    }
//    
//    func setupViews() {
//        backgroundColor = .white
//        
//        addSubview(linkLabel)
//        linkLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        linkLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        linkLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        linkLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//class InitialVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//    
//    let cellId = "cellId"
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
//        collectionView?.backgroundColor = .white
//        collectionView?.register(MyCell.self, forCellWithReuseIdentifier: cellId)
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        return 4
//        return links.count
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCell
//        cell.myLink = links[indexPath.row]
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: 70)
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selectedLink = links[indexPath.row]
////        let ref = Database.database().reference().child("product_links")
////        let childRef = ref.childByAutoId()
////        let values = ["product_url": selectedLink.title]
////        childRef.updateChildValues(values)
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
//
//}

//class InitialVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            let link = links[indexPath.row]
//            links.remove(at: indexPath.row)
//            coreStack.delete(link: link)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            
//        }
//    }    
//    
//}
