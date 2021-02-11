//
//  OurPicksViewController.swift
//  DCHub
//
//  Created by New Acc  on 26/1/21.
//

import UIKit
import Firebase
import FirebaseFirestore

class OurPicksViewController: UIViewController{

    @IBOutlet weak var ourPicksCollectionView:UICollectionView!
    @IBOutlet weak var ourPicksPageControl :UIPageControl!
    
    var slider = [ClothesSet]()
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        ourPicksCollectionView.delegate = self
        ourPicksCollectionView.dataSource = self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            db.collection("ClothesSet").getDocuments { (querySnapshot, err) in  //Get data for dancer info
                if let err = err{
                    //Handling errors
                    print("Could not retrieve documents:  \(err)" )
                }
                else{
                    for document in querySnapshot!.documents
                    {
                        let data = document.data()
                        let setTitle = data["setTitle"] as? String
                        let setDescription = data["setDescription"] as? String
                    
                        //Headwear
                        let headWearTitle = data["headWearTitle"] as? String
                        let headWearURL = data["headWearURL"] as? String
                        let headWearDescription = data["headWearDescription"] as? String
                        let headwear = HeadWear(title: headWearTitle!, description: headWearDescription!, url: headWearURL!)
                        
                        //Mask
                        
                        let maskTitle = data["maskTitle"] as? String
                        let maskURL = data["maskURL"] as? String
                        let maskDescription = data["maskDescription"] as? String
                        let mask = Mask(title: maskTitle!, description: maskDescription!, url: maskURL!)
                        
                        //Top
                        let topTitle = data["topTitle"] as? String
                        let topURL = data["topURL"] as? String
                        let topDescription = data["topDescription"] as? String
                        let top = Shirt(title: topTitle!, description: topDescription!, url: topURL!)
                        
                        //Bottom
                        let bottomTitle = data["bottomTitle"] as? String
                        let bottomURL = data["bottomURL"] as? String
                        let bottomDescription = data["bottomDescription"] as? String
                        let bottom = Pants(title: bottomTitle!, description: bottomDescription!, url: bottomURL!)
                        
                        //Shoe1
                        let shoe1Title  = data["shoe1Title"] as? String
                        let shoe1URL = data["shoe1URL"] as? String
                        let shoe1Description = data["shoe1Description"] as? String
                        let shoes1 = Shoes1(title: shoe1Title!, description: shoe1Description!, url: shoe1URL!)
                        
                        //Shoe2
                        let shoe2Title = data["shoe2Title"] as? String
                        let shoe2URL = data["shoe2URL"] as? String
                        let shoe2Description = data["shoe2Description"] as? String
                        let shoes2 = Shoes2(title: shoe2Title!, description: shoe2Description!, url: shoe2URL!)
                       
                        
                        let clothesSet = ClothesSet(title: setTitle!, description: setDescription!, headwear: headwear, mask: mask, top: top, bottom: bottom, shoe1: shoes1, shoe2: shoes2)
                        self.slider.append(clothesSet)

                    }
                    self.ourPicksPageControl.numberOfPages = self.slider.count
                    self.ourPicksCollectionView.reloadData()
                }
            }
        }
}
extension OurPicksViewController: UICollectionViewDataSource
{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slider.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "OurPicksCell", for: indexPath) as! OurPicksCell
        let clothesSet = slider[indexPath.item]
        cell.set = clothesSet
        return cell
    }
    
    
    
    
}
extension OurPicksViewController : UICollectionViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2

        ourPicksPageControl.currentPage = Int(offSet + horizontalCenter) / Int(width)
    }
}


