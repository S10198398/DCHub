//
//  BottomsViewController.swift
//  DCHub
//
//  Created by MAD2 on 8/2/21.
//

import UIKit

class BottomsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var bottomTable:UITableView!
    
    var bottoms = [Bottom]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottoms.append(Bottom(text: "Givenchy Sweats", imageName: "shop_bottoms-1", url: "https://www.farfetch.com/sg/shopping/men/givenchy-logo-embroidered-striped-track-pants-item-14143655.aspx?size=20&storeid=12999&utm_source=google&utm_medium=cpc&utm_keywordid=13899664&utm_shoppingproductid=14143655-83&pid=google_search&af_channel=Search&c=807025570&af_c_id=807025570&af_siteid=&af_keywords=pla-297186054669&af_adset_id=47428750532&af_ad_id=191711447989&af_sub1=13899664&af_sub5=14143655-83&is_retargeting=true&shopping=yes&gclid=EAIaIQobChMIwtets73a7gIVgU0rCh20fAVIEAQYByABEgKHIPD_BwE"))
        
        bottoms.append(Bottom(text: "Pumaline sweats", imageName: "shop_bottoms-2", url: "https://sg.puma.com/sg/en/pd/iconic-t7-knitted-mens-sweatpants/4060978308986.html?s_kwcid=PL-1-PUMA-SG-GO-EN-0000&mktID=PL%3ASingPost%3AGoogle%3A2019_AlwaysOn_Shopping_SPEC%3ASingapore&gclsrc=aw.ds&btID=PL-0-PUMA-SG-GO-EN-0000&utm_medium=display&utm_campaign=PL-0-PUMA-SG-GO-EN-0000-2019_AlwaysOn_Shopping_SPEC&utm_source=Google&gclid=EAIaIQobChMI9a_OqPja7gIVnoNLBR2paAjwEAQYAyABEgK_GvD_BwE"))
        
        
        // Do any additional setup after loading the view.
        bottomTable.register(BottomsTableViewCell.nib(), forCellReuseIdentifier: BottomsTableViewCell.identifier)
        bottomTable.delegate = self
        bottomTable.dataSource = self
    }
    //Table for featured returning rows according to number of items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bottomTable.dequeueReusableCell(withIdentifier: BottomsTableViewCell.identifier, for: indexPath) as! BottomsTableViewCell
        
        cell.configure(with: bottoms)
        
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

struct Bottom {
    let text: String
    let imageName:String
    let url: String
    
    init(text: String, imageName: String, url: String){
        self.text = text
        self.imageName = imageName
        self.url = url
    }
}
