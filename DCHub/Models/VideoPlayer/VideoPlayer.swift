//
//  VideoPlayer.swift
//  DCHub
//
//  Created by New Acc  on 9/2/21.
//

import UIKit
import AVKit
class VideoPlayer: UIView {
    @IBOutlet weak var vwPlayer:UIView!
    
    var player: AVPlayer?
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
    }

    fileprivate func addPlayerToView(_ view:UIView)
    {
        player = AVPlayer()
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.bounds
        playerLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(playerLayer)
        
    }
    func playVideoWithFileName(_ url: String, ofType: String)
    {
        guard let videoUrl = URL(string: url) else { return  }
        let playerItem = AVPlayerItem(url: videoUrl)
        player?.replaceCurrentItem(with: playerItem)
        player?.play()
    }
    func stopVideo()
    {
        
    }
}
