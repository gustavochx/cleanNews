//
//  APIClientTest.swift
//  cleanNewsTests
//
//  Created by Gustavo Henrique on 06/07/2018.
//  Copyright © 2018 Gustavo Henrique. All rights reserved.
//


@testable import cleanNews
import XCTest



class ApiClientDelegateSpy : NewsAPIDelegate {
    
    var newsDidFetchCalled : Bool = false
    var newsFetched : NewsResponse?
    
    func fetchNew(newsAPI: NewsAPIProtocol, alreadyFetchNews: NewsResponse) {
            newsDidFetchCalled = true
            newsFetched = alreadyFetchNews
    }

}

class APIClientTest: XCTestCase {

    var api : APIClient!
    var mySpy : ApiClientDelegateSpy!
    
    // MARK: life ci
    
    override func setUp() {
        super.setUp()
        setupApi()
        setupDelegate()
    }
    
    
    func setupApi() {
        self.api = APIClient()
    }
    
    func setupDelegate() {
        mySpy = ApiClientDelegateSpy()
    }
    
    func testShouldAskURLtoFetchAllNewsByCountry() {
        
        // When
        let fetchCompleted = expectation(description: "Wair for fetch all news")
        
        api.fetchByCountry(country: "US") { (returnData) in
            self.mySpy.fetchNew(newsAPI: self.api, alreadyFetchNews: returnData!)
            fetchCompleted.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5.0, handler: nil)
        XCTAssertTrue(mySpy.newsDidFetchCalled, "fetch(completionHandler:) should ask Alamofire to fetch news from NewsApi")
    }
    
    
    
    
}
