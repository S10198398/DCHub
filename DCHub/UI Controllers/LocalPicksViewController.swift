//
//  LocalPicksViewController.swift
//  DCHub
//
//  Created by New Acc  on 26/1/21.
//

import UIKit
class LocalPicksViewController: UIViewController {

    @IBOutlet weak var carousellCollectionView: UICollectionView!
    
    
    
    var carousellDancers = Dancer.fetchCarousell()
    override func viewDidLoad() {
        super.viewDidLoad()

        carousellCollectionView.dataSource = self
        for dancer in carousellDancers
        {
            print("yikes")
        }
       
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
}
extension LocalPicksViewController: UICollectionViewDataSource
{
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carousellDancers.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "CarousellCellCollectionViewCell", for: indexPath) as! CarousellCellCollectionViewCell
        
        let dancer = carousellDancers[indexPath.item]
        
        cell.dancer = dancer
        
        return cell
    }
}
