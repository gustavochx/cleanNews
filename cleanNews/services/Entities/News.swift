//
//  News.swift
//  cleanNews
//
//  Created by Gustavo Henrique on 29/06/2018.
//  Copyright © 2018 Gustavo Henrique. All rights reserved.
//

import UIKit
import ObjectMapper

class News: NSObject, Mappable {
    
    var source : Source?
    var author : String?
    var title : String?
    var desc : String?
    var url : String?
    var urlImage : String?
    var publishedAt : String?
    
    
    required init(map: Map) {}
    
    func mapping(map: Map) {
        
        source <- map["source"]
        author <- map["author"]
        title <- map["title"]
        desc <- map["description"]
        url <- map["url"]
        urlImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
    }
    
}
