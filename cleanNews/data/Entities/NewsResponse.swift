//
//  NewsResponse.swift
//  cleanNews
//
//  Created by Gustavo Henrique on 29/06/2018.
//  Copyright © 2018 Gustavo Henrique. All rights reserved.
//

import UIKit
import ObjectMapper

class NewsResponse: NSObject {

    var totalResults : Int?
    var articles : [News]?
    
    required init(map: Map) {}
    
    func mapping(map: Map) {
        
        totalResults <- map["totalResults"]
        articles <- map["articles"]
        
    }
    
}
