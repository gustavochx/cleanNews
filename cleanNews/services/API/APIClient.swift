//
//  APIClient.swift
//  cleanNews
//
//  Created by Gustavo Henrique on 29/06/2018.
//  Copyright © 2018 Gustavo Henrique. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper


protocol NewsAPIProtocol {
    
    func fetchByCountry(country: String, completionHandler completion:@escaping(NewsResponse?)->Void)
    func fetchBySource(source: String, completionHandler completion:@escaping(NewsResponse?)->Void)
    func fetchByKeyword(keyword: String, completionHandler completion:@escaping(NewsResponse?)->Void)
    
    var delegate : NewsAPIDelegate? { get set }
 
}

protocol NewsAPIDelegate {
    func fetchNew(newsAPI: NewsAPIProtocol, alreadyFetchNews: NewsResponse)
}

class APIClient: NSObject, NewsAPIProtocol {
    
    var delegate: NewsAPIDelegate?
    
    private var baseURL : String {
        return "https://newsapi.org/v2/top-headlines?"
    }
    
    private var apiKey: String {
        return "2ae09d3369984f6c99883f3e2ae811cc"
    }
    
    
    func fetchByCountry(country: String, completionHandler completion: @escaping (NewsResponse?) -> Void) {
    
        Alamofire.request(URL(string: baseURL+"country=\(country)")!,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding(),
                          headers: ["Authorization": apiKey]).responseJSON { (response) in
                            
            if response.result.isFailure {
                completion(nil)
            } else {
                if response.response?.statusCode == 200 {
                    if let response = Mapper<NewsResponse>().map(JSONObject: response.result.value) {
                        completion(response)
                    }
                } else {
                    completion(nil)
                }
            }
        }
    }
    
    
    func fetchBySource(source: String, completionHandler completion: @escaping (NewsResponse?) -> Void) {
        
        Alamofire.request(URL(string: baseURL+"source=\(source)")!,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding(),
                          headers: ["Authorization": apiKey]).responseJSON { (response) in
                            
                            if response.result.isFailure {
                                completion(nil)
                            } else {
                                if response.response?.statusCode == 200 {
                                    if let response = Mapper<NewsResponse>().map(JSONObject: response.result.value) {
                                        completion(response)
                                    }
                                } else {
                                    completion(nil)
                                }
                            }
            }
    }
    
    func fetchByKeyword(keyword: String, completionHandler completion: @escaping (NewsResponse?) -> Void) {
        
        Alamofire.request(URL(string: baseURL+"q=\(keyword)")!,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding(),
                          headers: ["Authorization": apiKey]).responseJSON { (response) in
                            
                            if response.result.isFailure {
                                completion(nil)
                            } else {
                                if response.response?.statusCode == 200 {
                                    if let response = Mapper<NewsResponse>().map(JSONObject: response.result.value) {
                                        completion(response)
                                    }
                                } else {
                                    completion(nil)
                                }
                            }
            }
    }
    
    
}

