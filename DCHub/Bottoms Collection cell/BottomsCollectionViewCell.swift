//
//  BottomsCollectionViewCell.swift
//  DCHub
//
//  Created by MAD2 on 8/2/21.
//

import UIKit

class BottomsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var bottomsLabel:UILabel!
    @IBOutlet var bottomsImageView:UIImageView!
    
    static let identifier = "BottomsCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "BottomsCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: Bottom){
        self.bottomsLabel.text = model.text
        self.bottomsImageView.image = UIImage(named: model.imageName)
    }

}
