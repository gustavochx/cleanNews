//
//  ListNewsWorker.swift
//  cleanNews
//
//  Created by Gustavo Henrique on 04/07/2018.
//  Copyright © 2018 Gustavo Henrique. All rights reserved.
//

import UIKit



protocol ListNewsWorkerDelegate {
    func listNewsWorker(newsWorker: ListNewsWorker, alreadyFetchNews: NewsResponse)
}

class ListNewsWorker : NewsAPIDelegate {

    var listAPI : APIClient = APIClient()
    var delegate : ListNewsWorkerDelegate?
    
    
    func fetch() {
        listAPI.delegate = self
    }
    
    func fetchByCountry(country: String, completionHandler completion: @escaping(NewsResponse?) -> Void ) {
        
        listAPI.fetchByCountry(country: country) { (response) in
            completion(response)
        }
        
    }
    
    
    func fetchNew(newsAPI: NewsAPIProtocol, alreadyFetchNews: NewsResponse) {
        delegate?.listNewsWorker(newsWorker: self, alreadyFetchNews: alreadyFetchNews)
    }
    
    
}
