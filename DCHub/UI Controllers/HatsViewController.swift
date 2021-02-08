//
//  HatsViewController.swift
//  DCHub
//
//  Created by MAD2 on 8/2/21.
//

import UIKit

class HatsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var hatTable: UITableView!
    
    var hats = [Hat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hats.append(Hat(text: "Kinbox BucketHat", imageName: "shop_caps-1", url: "https://store.kinjaz.com/products/kin-bucket-hat-1"))
        
        hats.append(Hat(text: "Arena La Cap", imageName: "shop_caps-2", url: "https://store.kinjaz.com/products/arena-la-dad-kap-black"))
        
        hats.append(Hat(text: "Arena La Cap (White)", imageName: "shop_caps-3", url: "https://store.kinjaz.com/products/arena-la-dad-kap-white"))
        
        
        // Do any additional setup after loading the view.
        hatTable.register(HatsTableViewCell.nib(), forCellReuseIdentifier: HatsTableViewCell.identifier)
        hatTable.delegate = self
        hatTable.dataSource = self
    }
    //Table for featured returning rows according to number of items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = hatTable.dequeueReusableCell(withIdentifier: HatsTableViewCell.identifier, for: indexPath) as! HatsTableViewCell
        
        cell.configure(with: hats)
        
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

struct Hat {
    let text: String
    let imageName:String
    let url: String
    
    init(text: String, imageName: String, url: String){
        self.text = text
        self.imageName = imageName
        self.url = url
    }
}
