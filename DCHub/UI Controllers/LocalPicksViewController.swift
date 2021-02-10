//
//  LocalPicksViewController.swift
//  DCHub
//
//  Created by New Acc  on 26/1/21.
//

import UIKit
import Firebase
import FirebaseFirestore

class LocalPicksViewController: UIViewController {

    
    //Outlets
    @IBOutlet weak var carousellCollectionView: UICollectionView!
    @IBOutlet weak var carousellPageControl : UIPageControl!
    
    
    //Variables
    var carousellDancers = [Dancer]()
    
    
    
    let db = Firestore.firestore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carousellCollectionView.delegate = self
        carousellCollectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        db.collection("Carousell").getDocuments { (querySnapshot, err) in
            if let err = err{
                //Handling errors
                print("Could not retrieve documents:  \(err)" )
            }
            else{
                for document in querySnapshot!.documents
                {
                    let data = document.data()
                    let dancerLogo = data["dancerLogo"] as? String
                    let dancerName = data["dancerName"] as? String
                    let dancerVideo = data["dancerVideo"] as? String
                    let description = data["description"] as? String
                    let dancer = Dancer(dancerLogo: dancerLogo!, dancerName: dancerName!, dancerVideo: dancerVideo!, description: description!)
                    self.carousellDancers.append(dancer)

                }
                self.carousellPageControl.numberOfPages = self.carousellDancers.count
                self.carousellCollectionView.reloadData()
            }
        }
    }
    
}
extension LocalPicksViewController: UICollectionViewDataSource{

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
extension LocalPicksViewController:UICollectionViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2

        carousellPageControl.currentPage = Int(offSet + horizontalCenter) / Int(width)
    }
}

