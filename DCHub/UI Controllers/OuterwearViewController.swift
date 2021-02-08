//
//  OuterwearViewController.swift
//  DCHub
//
//  Created by MAD2 on 8/2/21.
//

import UIKit

class OuterwearViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var outerTable:UITableView!
    
    var outerwears = [Outerwear]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outerwears.append(Outerwear(text: "Midknight Bomber", imageName: "shop_outerwear-1", url: "https://store.kinjaz.com/products/midknight-bomber-jacket"))
        
        outerwears.append(Outerwear(text: "Shadow Bomber", imageName: "shop_outerwear-2", url: "https://store.kinjaz.com/products/shadow-bomber-black-white"))
        
        outerwears.append(Outerwear(text: "Shuriken Hoodie Black", imageName: "shop_outerwear-3", url: "https://store.kinjaz.com/products/shurikin-hoodie-black"))
        
        outerwears.append(Outerwear(text: "Shuriken Hoodie Gray", imageName: "shop_outerwear-4", url: "https://store.kinjaz.com/products/shurikin-hoodie-grey"))
        
        // Do any additional setup after loading the view.
        outerTable.register(OuterwearTableViewCell.nib(), forCellReuseIdentifier: OuterwearTableViewCell.identifier)
        outerTable.delegate = self
        outerTable.dataSource = self
    }
    //Table for featured returning rows according to number of items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = outerTable.dequeueReusableCell(withIdentifier: OuterwearTableViewCell.identifier, for: indexPath) as! OuterwearTableViewCell
        
        cell.configure(with: outerwears)
        
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

struct Outerwear {
    let text: String
    let imageName:String
    let url: String
    
    init(text: String, imageName: String, url: String){
        self.text = text
        self.imageName = imageName
        self.url = url
    }
}
