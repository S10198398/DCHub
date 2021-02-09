//
//  Dancer.swift
//  DCHub
//
//  Created by New Acc  on 9/2/21.
//

import Foundation
import UIKit
import Firebase
import FirebaseFirestore

class Dancer
{
    var dancerLogo:UIImage
    var dancerName = ""
    var dancerVideo = ""
    var description = ""
    
    init(dancerLogo:UIImage, dancerName:String, dancerVideo:String, description:String) {
        self.dancerLogo = dancerLogo
        self.dancerName = dancerName
        self.dancerVideo = dancerVideo
        self.description = description
        
    }
    
    static func fetchCarousell()->[Dancer]
    {
        let db = Firestore.firestore()
        var dancers : [Dancer] = []
        db.collection("Carousell").getDocuments { (querySnapshot, err )in
            if let err = err{
                print("Error getting documents: \(err)")
            }else
            {
                
                for document in querySnapshot!.documents
                {
                    let data = document.data()
                    let dancerLogo = data["dancerLogo"] as? String
                    let dancerName = data["dancerName"] as? String
                    let dancerVideo = data["dancerVideo"] as? String
                    let description = data["description"] as? String
                    
                    let url = URL(string: dancerLogo!)
                    if let data = try? Data(contentsOf: url!)
                        {
                        let image: UIImage = UIImage(data: data)!
                        let dancer = Dancer(dancerLogo: image, dancerName: dancerName!, dancerVideo: dancerVideo!, description: description!)
                        dancers.append(dancer)
                        
                        }
                }
            }
        }
        return dancers
    }
    
    
    
    
}
