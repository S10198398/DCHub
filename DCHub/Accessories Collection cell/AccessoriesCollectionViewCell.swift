//
//  CollectionViewCell.swift
//  DCHub
//
//  Created by MAD2 on 8/2/21.
//

import UIKit

class AccessoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet var accessoryLabel: UILabel!
    @IBOutlet var accessoryImageView: UIImageView!
    
    static let identifier = "AccessoriesCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "AccessoriesCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: Accessory){
        self.accessoryLabel.text = model.text
        self.accessoryImageView.image = UIImage(named: model.imageName)
    }

}
