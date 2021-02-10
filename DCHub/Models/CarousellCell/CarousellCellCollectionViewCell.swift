//
//  CarousellCellCollectionViewCell.swift
//  DCHub
//
//  Created by New Acc  on 9/2/21.
//

import UIKit
import SDWebImage



class CarousellCellCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var videoPlayer: VideoPlayer!
    @IBOutlet weak var dancerName: UILabel!
    @IBOutlet weak var dancerLogo: UIImageView!
    
    var dancer:Dancer!
    {
        didSet{
            self.updateUI()
        }
    }
    func updateUI()
    {
        if dancer != nil
        {
            dancerName.text = dancer.dancerName
            dancerLogo.sd_setImage(with: URL(string: dancer.dancerLogo))
            print(dancer.dancerVideo)
            videoPlayer.playVideoWithFileName(dancer.dancerVideo)
        }
        else{
            dancerLogo.image = nil
            dancerName.text = "Hello"
            videoPlayer = nil
        }
        
    }
}

