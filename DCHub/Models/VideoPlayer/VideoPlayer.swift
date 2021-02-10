//
//  VideoPlayer.swift
//  DCHub
//
//  Created by New Acc  on 9/2/21.
//

import UIKit
import AVKit
import AVFoundation
class VideoPlayer: UIView {
    @IBOutlet weak var vwPlayer:UIView!
    
    var player: AVQueuePlayer!
    var looper: AVPlayerLooper!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    

    
    fileprivate func commonInit()
    {
        let viewFromXib = Bundle.main.loadNibNamed("VideoPlayer", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
        addPlayerToView(self.vwPlayer)
    }

    fileprivate func addPlayerToView(_ view:UIView)
    {
        player = AVQueuePlayer()
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.bounds
        playerLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(playerLayer)
        
    }
    func playVideoWithFileName(_ url: String)
    {
        guard let videoUrl = URL(string: url) else { return  }
        let playerItem = AVPlayerItem(url: videoUrl)
        looper = AVPlayerLooper(player: player, templateItem: playerItem)
        player.replaceCurrentItem(with: playerItem)
        
    }
    
}
