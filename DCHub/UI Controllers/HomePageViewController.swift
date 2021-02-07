//
//  HomePageViewController.swift
//  DCHub
//
//  Created by New Acc  on 26/1/21.
//
import youtube_ios_player_helper
import UIKit

/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/

class HomePageViewController: UIViewController, YTPlayerViewDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var PlayerView: YTPlayerView!
    
    @IBOutlet var table: UITableView!
    
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set the video to play automatically in line with the video ID
        PlayerView.delegate = self
        PlayerView.load(withVideoId: "pxc_igMzxXY", playerVars: ["playsinline": 1])
        // Do any additional setup after loading the view.
        /*
         This code is to make the scroll table for the featured items
         It will register the items as well as the number of table rows & columns
         */
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        
        models.append(Model(text: "First", imageName: "shop_top3"))
        
        models.append(Model(text: "Second", imageName: "shop_bottoms-1"))
        
        models.append(Model(text: "Third", imageName: "shop_outerwear-1"))
        
        models.append(Model(text: "Fourth", imageName: "shop_caps-1"))
        
        models.append(Model(text: "Fifth", imageName: "shop_accessories-1"))
    }
    
    //Table for featured returning rows according to number of items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        
        cell.configure(with: models)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
    //function to autoplay the video on the homepage
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        PlayerView.playVideo()
    }
}

struct Model {
    let text: String
    let imageName:String
    
    init(text: String, imageName: String){
        self.text = text
        self.imageName = imageName
    }
}
