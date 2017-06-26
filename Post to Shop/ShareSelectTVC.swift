//
//  ShareSelectTVC.swift
//  Post to Shop Redo
//
//  Created by Samuel Given on 6/22/17.
//  Copyright © 2017 Post to Shop. All rights reserved.
//

import UIKit
import CoreData

protocol ShareSelectViewControllerDelegate: class {
    func selected(link: Link)
}

class ShareSelectTVC: UITableViewController, URLSessionDelegate {
    
    var userLinks: [Link]!
    let reuseIdentifier = "linkCell"
    
    weak var delegate: ShareSelectViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        title = "Select Link"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userLinks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = userLinks[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.selected(link: userLinks[indexPath.row])
        }
    }
}


