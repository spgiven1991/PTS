//
//  BrandsController.swift
//  Post to Shop Redo
//
//  Created by Samuel Given on 6/21/17.
//  Copyright © 2017 Post to Shop. All rights reserved.
//

import UIKit
import LBTAComponents

class BrandsController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        tableView?.backgroundColor = .green
        
        return
    }
    
    func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}
