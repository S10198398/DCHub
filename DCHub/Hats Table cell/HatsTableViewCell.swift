//
//  HatsTableViewCell.swift
//  DCHub
//
//  Created by MAD2 on 8/2/21.
//

import UIKit

class HatsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    static let identifier = "HatsTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HatsTableViewCell", bundle: nil)
    }
    //configure the items
    func configure(with models: [Hat]) {
        self.hats = models
        hatsCollectionView.reloadData()
    }
    
    @IBOutlet var hatsCollectionView: UICollectionView!
    
    var hats = [Hat]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        hatsCollectionView.register(HatsCollectionViewCell.nib(), forCellWithReuseIdentifier: HatsCollectionViewCell.identifier)
        hatsCollectionView.delegate = self
        hatsCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    //collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HatsCollectionViewCell.identifier, for: indexPath) as! HatsCollectionViewCell
        cell.configure(with: hats[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: 240, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let url = URL(string: hats[indexPath.row].url) {
            UIApplication.shared.open(url)
        }
    }
}
