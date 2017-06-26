//
//  BrandsController.swift
//  Post to Shop Redo
//
//  Created by Samuel Given on 6/21/17.
//  Copyright © 2017 Post to Shop. All rights reserved.
//

import UIKit
import LBTAComponents
import CoreData
import MobileCoreServices

class BrandsController: UIViewController, UITextViewDelegate {
    
    var textView: ClickableTextView!
    var text: String!
    
    var link: Link?
    let coreStack = CoreDataStack.store
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(onBack(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(onShare(_:)))
        
        textView = ClickableTextView(frame: CGRect.zero, textContainer: nil)
        textView.delegate = self
        textView.frame = view.frame
        
        setInitialText()
        
        view.addSubview(textView)
    }
    
    func onBack(_ backButton: UIBarButtonItem) {
        if let text = textView.text {
            if link == nil {
                let date = NSDate()
                coreStack.storeLink(withTitle: text, onDate: date)
            } else {
                link!.title = text
                coreStack.saveContext()
            }
        }
        navigationController!.popViewController(animated: true)
    }
    
    func setInitialText() {
        if let link = link {
            textView.text = link.title
        } else {
            textView.text = nil
        }
    }
    
    func onShare(_ button: UIBarButtonItem) {
        
        var objectsToShare = [String]()
        
        if let text = textView.text {
            objectsToShare.append(text)
        }
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList]
        self.present(activityVC, animated: true, completion: nil)
        
        activityVC.completionWithItemsHandler =
            { (activityType, completed, returnedItems, error) in
                
                guard let returnedItems = returnedItems else {return}
                if returnedItems.count > 0 {
                    
                    let textItem: NSExtensionItem = returnedItems[0] as! NSExtensionItem
                    
                    let textItemProvider = textItem.attachments![0] as! NSItemProvider
                    
                    if textItemProvider.hasItemConformingToTypeIdentifier(kUTTypeText as String) {
                        
                        textItemProvider.loadItem(forTypeIdentifier: kUTTypeText as String, options: nil, completionHandler: { (string, error) in
                            let newtext = string as! String
                            self.textView.text = newtext
                        })
                    }
                }
        }
    } 
    
}
