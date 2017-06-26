//
//  InitialVC.swift
//  Post to Shop Redo
//
//  Created by Samuel Given on 6/23/17.
//  Copyright © 2017 Post to Shop. All rights reserved.
//

import UIKit

class InitialVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var links: [Link] = []
    
    let coreStack = CoreDataStack.store
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIApplicationWillEnterForeground, object: nil, queue: nil, using: reload)
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = self.view.frame
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAdd(_:)))
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coreStack.fetchLinks()
        links = coreStack.fetchedLinks
        tableView.reloadData()
    }
    
    func reload(notification: Notification) {
        self.coreStack.fetchLinks()
        self.links = self.coreStack.fetchedLinks
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return links.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let link = links[indexPath.row]
        cell.textLabel?.text = link.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dest = BrandsController()
        let selectedLink = links[indexPath.row]
        dump(selectedLink)
        dest.link = links[indexPath.row]
        navigationController?.pushViewController(dest, animated: false)
    }
    
    func onAdd(_ barItem: UIBarButtonItem) {
        let dest = BrandsController()
        navigationController?.pushViewController(dest, animated: false)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let link = links[indexPath.row]
            links.remove(at: indexPath.row)
            coreStack.delete(link: link)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }    
    
}
