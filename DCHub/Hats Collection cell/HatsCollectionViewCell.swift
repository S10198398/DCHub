//
//  HatsCollectionViewCell.swift
//  DCHub
//
//  Created by MAD2 on 8/2/21.
//

import UIKit

class HatsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var hatsLabel:UILabel!
    @IBOutlet var hatsImageView:UIImageView!
    
    static let identifier = "HatsCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HatsCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: Hat){
        self.hatsLabel.text = model.text
        self.hatsImageView.image = UIImage(named: model.imageName)
    }

}
