//
//  ListNewsViewController.swift
//  cleanNews
//
//  Created by Gustavo Henrique on 02/07/2018.
//  Copyright © 2018 Gustavo Henrique. All rights reserved.
//

import UIKit

protocol ListNewsDisplayLogic : class {
    func displayNews(news: [News])
}


class ListNewsViewController: UIViewController, ListNewsDisplayLogic {
    
    @IBOutlet weak var tableView: UITableView!
    
    var interactor : ListNewsBusinessLogic?
    var router : (NSObjectProtocol & ListNewsRouterLogic & ListNewsPassInputs)?
    
    var displayedNews = [News]()
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
        let viewController = self
        let interactor = ListNewsInteractor()
        let presenter = ListNewsPresenter()
        let router = ListNewsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNewsByCountry(country: "US")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func fetchNewsByCountry(country: String) {
        
        interactor?.fetchNewsCountry(country: country)
    
    }
    
    
    func displayNews(news: [News]) {
        
        displayedNews = news
        tableView.reloadData()
        
    }
    
    
}

extension ListNewsViewController : UITableViewDelegate {
    
}

extension ListNewsViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let displayedNew = self.displayedNews[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = displayedNew.title!
        cell?.detailTextLabel?.text = displayedNew.desc!
        
        return cell!
    }
    
    
}
