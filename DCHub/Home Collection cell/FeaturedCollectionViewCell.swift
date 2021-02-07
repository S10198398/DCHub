//
//  FeaturedCollectionViewCell.swift
//  DCHub
//
//  Created by MAD2 on 7/2/21.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet var myLable: UILabel
    @IBOutlet var myImageView: UIImageView
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: Item) {
        self.myLable.text = model.text
        self.myImageView.image = UIImage(named: model.imageName)
    }
}
