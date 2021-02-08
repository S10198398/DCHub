//
//  TopsCollectionViewCell.swift
//  DCHub
//
//  Created by MAD2 on 8/2/21.
//

import UIKit

class TopsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var topLabel: UILabel!
    @IBOutlet var topImageView: UIImageView!
    
    static let identifier = "TopsCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TopsCollectionViewCell", bundle: nil)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: Top){
        self.topLabel.text = model.text
        self.topImageView.image = UIImage(named: model.imageName)
    }

}
