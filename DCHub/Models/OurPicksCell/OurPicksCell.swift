//
//  OurPicksCell.swift
//  DCHub
//
//  Created by New Acc  on 11/2/21.
//

import UIKit
import SDWebImage

class OurPicksCell: UICollectionViewCell {
    
    @IBOutlet weak var setTitle: UILabel!
    @IBOutlet weak var setDescription: UITextView!
    
    @IBOutlet weak var headWearImage: UIImageView!
    @IBOutlet weak var headWearTitle: UILabel!
    
    @IBOutlet weak var maskImage: UIImageView!
    @IBOutlet weak var maskTitle: UILabel!
    
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var topTitle: UILabel!
    
    @IBOutlet weak var bottomImage: UIImageView!
    @IBOutlet weak var bottomTitle: UILabel!
    
    @IBOutlet weak var shoe1Image: UIImageView!
    @IBOutlet weak var shoe1Title: UILabel!
    
    @IBOutlet weak var shoe2Image: UIImageView!
    @IBOutlet weak var shoe2Title: UILabel!
    
    var set : ClothesSet!
    {
        didSet{
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        if set != nil
        {
            setDescription.isEditable = false
            
            setTitle.text = set.setTitle
            setDescription.text = set.setDescription
            headWearImage.sd_setImage(with: URL(string: set.headWear.url))
            headWearTitle.text = set.headWear.title
            
            maskImage.sd_setImage(with: URL(string: set.mask.url))
            maskTitle.text = set.mask.title
            
            topImage.sd_setImage(with : URL(string: set.top.url))
            topTitle.text = set.top.title
            
            bottomImage.sd_setImage(with : URL(string: set.bottom.url))
            bottomTitle.text = set.bottom.title
            
            shoe1Image.sd_setImage(with : URL(string: set.shoes1.url))
            shoe1Title.text = set.shoes1.title
            
            shoe2Image.sd_setImage(with: URL(string: set.shoes2.url))
            shoe2Title.text = set.shoes2.title
            
            //set click to send to url
            let goHeadWear = UITapGestureRecognizer(target: self, action: #selector(self.goHeadWear))
            headWearImage.addGestureRecognizer(goHeadWear)
            headWearImage.isUserInteractionEnabled = true
            
            let goMask = UITapGestureRecognizer(target: self, action : #selector(self.goMask))
            maskImage.addGestureRecognizer(goMask)
            maskImage.isUserInteractionEnabled = true
            
            let goTop = UITapGestureRecognizer(target: self, action : #selector(self.goTop))
            topImage.addGestureRecognizer(goTop)
            topImage.isUserInteractionEnabled = true
            
            let goBottom = UITapGestureRecognizer(target: self, action : #selector(self.goBottom))
            bottomImage.addGestureRecognizer(goBottom)
            bottomImage.isUserInteractionEnabled = true
            
            let goShoe1 = UITapGestureRecognizer(target: self, action : #selector(self.goShoe1))
            shoe1Image.addGestureRecognizer(goShoe1)
            shoe1Image.isUserInteractionEnabled = true
            
            let goShoe2 = UITapGestureRecognizer(target: self, action : #selector(self.goShoe2))
            shoe2Image.addGestureRecognizer(goShoe2)
            shoe2Image.isUserInteractionEnabled = true
        
        }
    }
    
    @objc func goHeadWear(sender: UITapGestureRecognizer)
    {
        if let url = URL(string: set.headWear.description)
        {
            UIApplication.shared.open(url)
        }
        
    }
    
    @objc func goMask(sender: UITapGestureRecognizer)
    {
        if let url = URL(string: set.mask.description)
        {
            UIApplication.shared.open(url)
        }
        
    }
    
    @objc func goTop(sender: UITapGestureRecognizer)
    {
        if let url = URL(string: set.top.description)
        {
            UIApplication.shared.open(url)
        }
        
    }
    
    @objc func goBottom(sender: UITapGestureRecognizer)
    {
        if let url = URL(string: set.bottom.description)
        {
            UIApplication.shared.open(url)
        }
        
    }
    
    
    @objc func goShoe1(sender: UITapGestureRecognizer)
    {
        if let url = URL(string: set.shoes1.description)
        {
            UIApplication.shared.open(url)
        }
        
    }
    @objc func goShoe2(sender: UITapGestureRecognizer)
    {
        if let url = URL(string: set.mask.description)
        {
            UIApplication.shared.open(url)
        }
        
    }
    
}
