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
    var dancerLogo = ""
    var dancerName = ""
    var dancerVideo = ""
    var songDescription = ""
    var dancerDescription = ""
    var instagram = ""
    
        
    init(dancerLogo:String, dancerName:String, dancerVideo:String, songDescription:String, dancerDescription:String, instagram:String) {
        self.dancerLogo = dancerLogo
        self.dancerName = dancerName
        self.dancerVideo = dancerVideo
        self.songDescription = songDescription
        self.dancerDescription = dancerDescription
        self.instagram = instagram
        
        
    }
    
}
