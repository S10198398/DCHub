//
//  AccessoriesTableViewCell.swift
//  DCHub
//
//  Created by MAD2 on 8/2/21.
//

import UIKit

class AccessoriesTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    static let identifier = "AccessoriesTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "AccessoriesTableViewCell", bundle: nil)
    }
    //configure the items
    func configure(with models: [Accessory]) {
        self.accessories = models
        accessoryCollectionView.reloadData()
    }
    
    @IBOutlet var accessoryCollectionView: UICollectionView!
    
    var accessories = [Accessory]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        accessoryCollectionView.register(AccessoriesCollectionViewCell.nib(), forCellWithReuseIdentifier: AccessoriesCollectionViewCell.identifier)
        accessoryCollectionView.delegate = self
        accessoryCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //Collection view
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return accessories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccessoriesCollectionViewCell.identifier, for: indexPath) as! AccessoriesCollectionViewCell
        cell.configure(with: accessories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: 240, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = URL(string: accessories[indexPath.row].url) {
            UIApplication.shared.open(url)
        }
    }
    
}
