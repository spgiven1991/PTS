//
//  UserCell.swift
//  Post to Shop Redo
//
//  Created by Samuel Given on 6/21/17.
//  Copyright © 2017 Post to Shop. All rights reserved.
//

import UIKit
import LBTAComponents

let postToShopRed = UIColor(r: 233, g: 27, b: 129)

class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let userProduct = datasourceItem as? UserProduct else { return }
            productLabel.text = userProduct.product
            priceLabel.text = userProduct.price
            buyLabel.text = userProduct.buy
            productImageView.image = userProduct.productImage
        }
    }
    
    let productLabel: UILabel = {
        let label = UILabel()
        //        label.text = "Sequin Lace Long Sleeve"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        //        label.text = "$123.00"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        return label
    }()
    
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        //        imageView.image = #imageLiteral(resourceName: "product_image")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let buyLabel: UITextView = {
        let label = UITextView()
        label.text = "You receive $6.50 when BUY NOW!"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    let copyButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = postToShopRed.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Check", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(postToShopRed, for: .normal)
        return button
    }()
    
    // not working....
    func handleCheck(sender: Any) {
        print("tapped")
    }
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(productLabel)
        addSubview(priceLabel)
        addSubview(productImageView)
        addSubview(buyLabel)
        addSubview(copyButton)
        
        productLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 30)
        
        priceLabel.anchor(productLabel.bottomAnchor, left: productLabel.leftAnchor, bottom: nil, right: productLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 12)
        
        productImageView.anchor(priceLabel.bottomAnchor, left: priceLabel.leftAnchor, bottom: nil, right: priceLabel.rightAnchor, topConstant: 4, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 180)
        
        buyLabel.anchor(productImageView.bottomAnchor, left: productImageView.leftAnchor, bottom: self.bottomAnchor, right: productImageView.rightAnchor, topConstant: 4, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        copyButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 45, heightConstant: 23)
        
        copyButton.addTarget(self, action: #selector(handleCheck), for: .touchUpInside)
    }
}
