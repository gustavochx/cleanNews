//
//  Source.swift
//  cleanNews
//
//  Created by Gustavo Henrique on 29/06/2018.
//  Copyright © 2018 Gustavo Henrique. All rights reserved.
//

import UIKit
import ObjectMapper

class Source: NSObject {
    
    var id : String?
    var name : String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
    
    
}
