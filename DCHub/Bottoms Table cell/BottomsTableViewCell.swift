//
//  BottomsTableViewCell.swift
//  DCHub
//
//  Created by MAD2 on 8/2/21.
//

import UIKit

class BottomsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    static let identifier = "BottomsTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "BottomsTableViewCell", bundle: nil)
    }
    //configure the items
    func configure(with models: [Bottom]) {
        self.bottoms = models
        bottomsCollectionView.reloadData()
    }
    
    @IBOutlet var bottomsCollectionView: UICollectionView!
    
    var bottoms = [Bottom]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bottomsCollectionView.register(BottomsCollectionViewCell.nib(), forCellWithReuseIdentifier: BottomsCollectionViewCell.identifier)
        bottomsCollectionView.delegate = self
        bottomsCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //Collection view
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bottoms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BottomsCollectionViewCell.identifier, for: indexPath) as! BottomsCollectionViewCell
        cell.configure(with: bottoms[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: 240, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = URL(string: bottoms[indexPath.row].url) {
            UIApplication.shared.open(url)
        }
    }
    
}
