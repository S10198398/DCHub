//
//  HomePageViewController.swift
//  DCHub
//
//  Created by New Acc  on 26/1/21.
//
import youtube_ios_player_helper
import UIKit

class HomePageViewController: UIViewController, YTPlayerViewDelegate {

    @IBOutlet var PlayerView: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set the video to play automatically in line with the video ID
        PlayerView.delegate = self
        PlayerView.load(withVideoId: "pxc_igMzxXY", playerVars: ["playsinline": 1])
        // Do any additional setup after loading the view.
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        PlayerView.playVideo()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
