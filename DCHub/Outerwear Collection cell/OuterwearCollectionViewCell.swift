//
//  OuterwearCollectionViewCell.swift
//  DCHub
//
//  Created by MAD2 on 8/2/21.
//

import UIKit

class OuterwearCollectionViewCell: UICollectionViewCell {

    @IBOutlet var outerwearLabel: UILabel!
    @IBOutlet var outerwearImageView: UIImageView!
    
    static let identifier = "OuterwearCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "OuterwearCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: Outerwear){
        self.outerwearLabel.text = model.text
        self.outerwearImageView.image = UIImage(named: model.imageName)
    }

}
