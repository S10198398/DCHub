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
        func downloadImage(urlImage : String?, complete: ((UIImage?)->Void)? = nil){

            let url = URL(string: urlImage!)
            let urlRequest = URLRequest(url: url!)
            let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let data = data {
                   complete?(UIImage(data: data))
                }
            }
            task.resume()
        }
        var dancers : [Dancer] = []
        let db = Firestore.firestore()
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
                    var dancerImage = UIImage()
                    downloadImage(urlImage: dancerLogo) { (image) in
                        if let image = image
                        {
                            dancerImage = image
                        }
                    }
                    
                    let dancer = Dancer(dancerLogo: dancerImage, dancerName: dancerName!, dancerVideo: dancerVideo!, description: description!)
                    dancers.append(dancer)
                }
            }
        }
        return dancers
    }
}
