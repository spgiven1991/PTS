//
//  CustomTextView.swift
//  Post to Shop Redo
//
//  Created by Samuel Given on 6/23/17.
//  Copyright © 2017 Post to Shop. All rights reserved.
//

import Foundation
import UIKit

public class ClickableTextView: UITextView {
    
    var tap: UITapGestureRecognizer!
    
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        setup()
    }
    
    
    func setup() {
        tap = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        
        self.addGestureRecognizer(tap)
    }
    
    func onTap(_ sender: UITapGestureRecognizer) {
        
        let myTextView = sender.view as! UITextView
        let layoutManger = myTextView.layoutManager
        
        var location = sender.location(in: myTextView)
        location.x -= myTextView.textContainerInset.left;
        location.y -= myTextView.textContainerInset.top;
        
        let characterIndex = layoutManager.characterIndex(for: location, in: myTextView.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        if characterIndex < myTextView.textStorage.length {
            
            let orgString = myTextView.attributedText.string
            
            var didFind = false
            var count:Int = characterIndex
            while(count > 2 && didFind == false) {
                
                let myRange = NSRange(location: count-1, length: 2)
                let substring = (orgString as NSString).substring(with: myRange)
                
                if substring == " h" || (substring == "tp" && count == 3) {
                    didFind = true
                    
                    var count2 = count
                    while(count2 < orgString.characters.count) {
                        
                        let myRange = NSRange(location: count2 - 1, length: 2)
                        let substring = (orgString as NSString).substring(with: myRange)
                        
                        count2 += 1
                        
                        if count2 == orgString.characters.count {
                            
                            let length = orgString.characters.count - count
                            let myRange = NSRange(location: count, length: length)
                            
                            let substring = (orgString as NSString).substring(with: myRange)
                            
                            openLink(link: substring)
                            return
                        }
                        
                        if substring.hasSuffix(" ") {
                            
                            let length = count2 - count
                            let myRange = NSRange(location: count, length: length)
                            
                            let substring = (orgString as NSString).substring(with: myRange)
                            
                            openLink(link: substring)
                            return
                        }
                    }
                    
                    return
                }
                if substring.hasPrefix(" ") {
                    return
                }
                
                count -= 1
            }
        }
        
    }
    
    func openLink(link: String) {
//        print("URL")
    }
}

