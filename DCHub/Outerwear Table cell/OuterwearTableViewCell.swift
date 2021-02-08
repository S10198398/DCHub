//
//  OuterwearTableViewCell.swift
//  DCHub
//
//  Created by MAD2 on 8/2/21.
//

import UIKit

class OuterwearTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    static let identifier = "OuterwearTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "OuterwearTableViewCell", bundle: nil)
    }
    //configure the items
    func configure(with models: [Outerwear]) {
        self.outerwears = models
        outerwearCollectionView.reloadData()
    }
    
    @IBOutlet var outerwearCollectionView: UICollectionView!
    
    var  outerwears = [Outerwear]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        outerwearCollectionView.register(OuterwearCollectionViewCell.nib(), forCellWithReuseIdentifier: OuterwearCollectionViewCell.identifier)
        outerwearCollectionView.delegate = self
        outerwearCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //Collection view
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return outerwears.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OuterwearCollectionViewCell.identifier, for: indexPath) as! OuterwearCollectionViewCell
        cell.configure(with: outerwears[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: 240, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = URL(string: outerwears[indexPath.row].url) {
            UIApplication.shared.open(url)
        }
    }
}
