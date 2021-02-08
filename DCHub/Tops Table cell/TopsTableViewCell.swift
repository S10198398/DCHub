//
//  TopsTableViewCell.swift
//  DCHub
//
//  Created by MAD2 on 8/2/21.
//

import UIKit

class TopsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    static let identifier = "TopsTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TopsTableViewCell", bundle: nil)
    }
    
    //configure the items
    func configure(with models: [Top]) {
        self.tops = models
        topsCollectionView.reloadData()
    }
    
    @IBOutlet var topsCollectionView: UICollectionView!
    
    var tops = [Top]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        topsCollectionView.register(TopsCollectionViewCell.nib(), forCellWithReuseIdentifier: TopsCollectionViewCell.identifier)
        topsCollectionView.delegate = self
        topsCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    //Collection view
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tops.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopsCollectionViewCell.identifier, for: indexPath) as! TopsCollectionViewCell
        cell.configure(with: tops[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: 240, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = URL(string: tops[indexPath.row].url) {
            UIApplication.shared.open(url)
        }
    }
    
}
