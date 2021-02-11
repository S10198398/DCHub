//
//  ClothesSet.swift
//  DCHub
//
//  Created by New Acc  on 11/2/21.
//

import Foundation
class ClothesSet
{
    var setTitle = ""
    var setDescription = ""
    var headWear:HeadWear
    var mask: Mask
    var top: Shirt
    var bottom : Pants
    var shoes1 : Shoes1
    var shoes2 : Shoes2
    
    init(title : String, description : String, headwear: HeadWear, mask: Mask, top : Shirt, bottom: Pants, shoe1: Shoes1, shoe2: Shoes2) {
        self.setTitle = title
        self.setDescription = description
        self.headWear = headwear
        self.mask = mask
        self.top = top
        self.bottom = bottom
        self.shoes1 = shoe1
        self.shoes2 = shoe2
        
        
    }
    
}
struct HeadWear {
    var title = ""
    var description = ""
    var url = ""
    init(title: String, description : String, url : String) {
        self.title = title
        self.description = description
        self.url = url
    }
}
struct Mask{
    var title = ""
    var description = ""
    var url = ""
    
    
    init(title: String, description : String, url : String) {
        self.title = title
        self.description = description
        self.url = url
    }
    
}

struct Shirt{
    var title = ""
    var description = ""
    var url = ""
    init(title: String, description : String, url : String) {
        self.title = title
        self.description = description
        self.url = url
        
    }
    
}
struct Pants
{
    var title = ""
    var description = ""
    var url = ""
    init(title: String, description : String, url : String) {
        self.title = title
        self.description = description
        self.url = url
    }
    
}
struct Shoes1
{
    var title = ""
    var description = ""
    var url = ""
    init(title: String, description : String, url : String) {
        self.title = title
        self.description = description
        self.url = url
    }
    
}
struct Shoes2
{
    var title = ""
    var description = ""
    var url = ""
    init(title: String, description : String, url : String) {
        self.title = title
        self.description = description
        self.url = url
    }
    
}
