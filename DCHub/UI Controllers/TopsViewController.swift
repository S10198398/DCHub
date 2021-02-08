//
//  TopsViewController.swift
//  DCHub
//
//  Created by MAD2 on 8/2/21.
//

import UIKit

class TopsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var topTable: UITableView!
    
    var tops = [Top]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tops.append(Top(text: "Ambush hunter", imageName: "shop_top1", url: "https://store.kinjaz.com/products/ambush-pack-hunter-tee-grey"))
        
        tops.append(Top(text: "Kin Smoke", imageName: "shop_top2", url: "https://store.kinjaz.com/products/kin-smoke-tee-black"))
        
        tops.append(Top(text: "Krest Longsleeve", imageName: "shop_top3", url: "https://store.kinjaz.com/products/krest-long-sleeve-tee-black"))
        
        tops.append(Top(text: "RAFN Longsleeve", imageName: "shop_top4", url: "https://store.kinjaz.com/products/rafn-long-sleeves-white"))
        
        tops.append(Top(text: "BLM RAFN Tee", imageName: "shop_top5", url: "https://store.kinjaz.com/products/yp-supports-bp-tee"))
        
        topTable.register(TopsTableViewCell.nib(), forCellReuseIdentifier: TopsTableViewCell.identifier)
        topTable.delegate = self
        topTable.dataSource = self
    }
    //Table for featured returning rows according to number of items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = topTable.dequeueReusableCell(withIdentifier: TopsTableViewCell.identifier, for: indexPath) as! TopsTableViewCell
        
        cell.configure(with: tops)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500.0
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

struct Top {
    let text: String
    let imageName:String
    let url: String
    
    init(text: String, imageName: String, url: String){
        self.text = text
        self.imageName = imageName
        self.url = url
    }
}
