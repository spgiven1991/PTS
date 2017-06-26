//
//  ShareViewController.swift
//  Post to Shop
//
//  Created by Samuel Given on 6/21/17.
//  Copyright © 2017 Post to Shop. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices
import CoreData

class ShareViewController: SLComposeServiceViewController {
    
    private var urlString: String?
    private var textString: String?
    var selectedLink: Link!
    let store = CoreDataStack.store
    var links = [Link]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchLinks()
        links = store.fetchedLinks
        
        let extensionItem = extensionContext?.inputItems[0] as! NSExtensionItem
        let contentTypeURL = kUTTypeURL as String
        let contentTypeText = kUTTypeText as String
        
        for attachment in extensionItem.attachments as! [NSItemProvider] {
            if attachment.isURL {
                attachment.loadItem(forTypeIdentifier: contentTypeURL, options: nil, completionHandler: { (results, error) in
                    let url = results as! URL?
                    self.urlString = url!.absoluteString
                })
            }
            if attachment.isText {
                attachment.loadItem(forTypeIdentifier: contentTypeText, options: nil, completionHandler: { (results, error) in
                    let text = results as! String
                    _ = self.isContentValid()
                })
            }
        }
    }

    override func isContentValid() -> Bool {
        
        if urlString != nil || textString != nil {
            if !contentText.isEmpty {
                return true
            }
        }
        return true
    }

    override func didSelectPost() {
        guard let text = textView.text else {return}
        let date = NSDate()
        
        if selectedLink == nil {
            if let string = urlString {
                store.storeLink(withTitle: "\(text)\n\(string)", onDate: date)
            } else {
                store.storeLink(withTitle: text, onDate: date)
            }
        } else {
            var currentTitle = selectedLink.title!
            if let string = urlString {
                currentTitle.append("\n\(text)\n\(string)")
                store.storeLink(withTitle: currentTitle, onDate: date)
                store.delete(link: selectedLink)
            } else {
                currentTitle.append("\n\(text)")
                store.storeLink(withTitle: currentTitle, onDate: date)
                store.delete(link: selectedLink)
            }
        }
        
        
        extensionContext?.completeRequest(returningItems: nil, completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        let item = SLComposeSheetConfigurationItem()
        item?.title = "Selected Link"
        item?.value = selectedLink?.title ?? "New Link"
        item?.tapHandler = {
            let vc = ShareSelectTVC()
            vc.delegate = self
            vc.userLinks = self.links
            self.pushConfigurationViewController(vc)
        }
        return [item]
    }

}

extension ShareViewController: ShareSelectViewControllerDelegate {
    func selected(link: Link) {
        selectedLink = link
        reloadConfigurationItems()
        popConfigurationViewController()
    }
}

extension NSItemProvider {
    
    var isURL: Bool {
        return hasItemConformingToTypeIdentifier(kUTTypeURL as String)
    }
    
    var isText: Bool {
        return hasItemConformingToTypeIdentifier(kUTTypeText as String)
    }
}











