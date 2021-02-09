//
//  AccessoriesViewController.swift
//  DCHub
//
//  Created by MAD2 on 8/2/21.
//

import UIKit

class AccessoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var accessoryTable: UITableView!
    
    var accessories = [Accessory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        accessories.append(Accessory(text: "Mask 2.0 Black", imageName: "shop_accessories-1", url: "https://store.kinjaz.com/products/black-kin-asm-mask"))
        
        accessories.append(Accessory(text: "Mask 2.0 White", imageName: "shop_accessories-2", url: "https://store.kinjaz.com/products/kin-asm-mask-2-0-white"))
        
        accessories.append(Accessory(text: "Tiger-Eyes keyclip", imageName: "shop_accessories-3", url: "https://store.kinjaz.com/products/tiger-eyes-key-clip"))
        
        accessories.append(Accessory(text: "Dojo Pin", imageName: "shop_accessories-4", url: "https://store.kinjaz.com/products/dojo-pin"))
        
        // Do any additional setup after loading the view.
        accessoryTable.register(AccessoriesTableViewCell.nib(), forCellReuseIdentifier: AccessoriesTableViewCell.identifier)
        accessoryTable.delegate = self
        accessoryTable.dataSource = self
    }
    //Table for featured returning rows according to number of items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = accessoryTable.dequeueReusableCell(withIdentifier: AccessoriesTableViewCell.identifier, for: indexPath) as! AccessoriesTableViewCell
        
        cell.configure(with: accessories)
        
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

struct Accessory {
    let text: String
    let imageName:String
    let url: String
    
    init(text: String, imageName: String, url: String){
        self.text = text
        self.imageName = imageName
        self.url = url
    }
}
