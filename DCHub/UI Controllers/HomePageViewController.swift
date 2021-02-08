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
        
        models.append(Model(text: "Longsleeve", imageName: "shop_top3", url: "https://store.kinjaz.com/products/krest-long-sleeve-tee-black"))
        
        models.append(Model(text: "Sweatpants", imageName: "shop_bottoms-1", url: "https://www.farfetch.com/sg/shopping/men/givenchy-logo-embroidered-striped-track-pants-item-14143655.aspx?size=20&storeid=12999&utm_source=google&utm_medium=cpc&utm_keywordid=13899664&utm_shoppingproductid=14143655-83&pid=google_search&af_channel=Search&c=807025570&af_c_id=807025570&af_siteid=&af_keywords=pla-297186054669&af_adset_id=47428750532&af_ad_id=191711447989&af_sub1=13899664&af_sub5=14143655-83&is_retargeting=true&shopping=yes&gclid=EAIaIQobChMIwtets73a7gIVgU0rCh20fAVIEAQYByABEgKHIPD_BwE"))
        
        models.append(Model(text: "Midknight Jacket", imageName: "shop_outerwear-1", url: "https://store.kinjaz.com/products/midknight-bomber-jacket"))
        
        models.append(Model(text: "Kin Bucket hat", imageName: "shop_caps-1", url: "https://store.kinjaz.com/products/kin-bucket-hat-1"))
        
        models.append(Model(text: "mask", imageName: "shop_accessories-1", url: "https://store.kinjaz.com/products/black-kin-asm-mask"))
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
    let url: String
    
    init(text: String, imageName: String, url: String){
        self.text = text
        self.imageName = imageName
        self.url = url
    }
}
