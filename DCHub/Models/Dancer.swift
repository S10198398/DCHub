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
    
}
