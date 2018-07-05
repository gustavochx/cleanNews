//
//  ListNewsPresenter.swift
//  cleanNews
//
//  Created by Gustavo Henrique on 02/07/2018.
//  Copyright © 2018 Gustavo Henrique. All rights reserved.
//

import UIKit

protocol ListNewsPresentationLogic {
    
    func presentFetchedNewsByCountry(response: NewsResponse)
}

class ListNewsPresenter: ListNewsPresentationLogic {


    weak var viewController : ListNewsDisplayLogic?
    
    func presentFetchedNewsByCountry(response: NewsResponse) {
        
        let news = convertedNews(response: response)
        viewController?.displayNews(news: news)
    
    }

    private func convertedNews(response: NewsResponse) -> [News] {
        return response.articles!
    }

}

