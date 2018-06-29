//
//  APIClient.swift
//  cleanNews
//
//  Created by Gustavo Henrique on 29/06/2018.
//  Copyright © 2018 Gustavo Henrique. All rights reserved.
//

import Foundation


enum APITarget {
    case getTopHeadlinesCountry(country: String)
    case getTopHeadlinesSource(source: String)
    case getTopHeadlinesFromKeyword(keyword: String)
}


class APIClient: NSObject {
    static var baseURL : URL {
        return URL(string: "https://newsapi.org/v2/top-headlines?")!
    }
}

