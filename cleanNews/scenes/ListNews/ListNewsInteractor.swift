//
//  ListNewsInteractor.swift
//  cleanNews
//
//  Created by Gustavo Henrique on 02/07/2018.
//  Copyright © 2018 Gustavo Henrique. All rights reserved.
//

import UIKit



// Regra de negócio atrelada a busca de dados pela API
protocol ListNewsBusinessLogic {
    func fetchNewsCountry(country: String)
}

protocol ListNewsDataStore {
    
}


class ListNewsInteractor: ListNewsBusinessLogic, ListNewsDataStore, ListNewsWorkerDelegate {
    
    var presenter : ListNewsPresentationLogic?
    var worker : ListNewsWorker = ListNewsWorker()
    
    enum AsyncOperationKind {
        case block, delegate
    }
    
    var asyncOpKind = AsyncOperationKind.block
    
    func fetchNewsCountry(country: String) {
        
        switch asyncOpKind {
            
            case .block :
                worker.fetchByCountry(country: country) { (response) in
                    
                    if let response = response {
                        self.presenter?.presentFetchedNewsByCountry(response: response)
                    }
                    
                }
            
            case .delegate:
                worker.delegate = self
            
        }
    }
    
    func listNewsWorker(newsWorker: ListNewsWorker, alreadyFetchNews: NewsResponse) {
        
        presenter?.presentFetchedNewsByCountry(response: alreadyFetchNews)
    }
    
    
    
    
}
