//
//  ListNewsRouter.swift
//  cleanNews
//
//  Created by Gustavo Henrique on 04/07/2018.
//  Copyright © 2018 Gustavo Henrique. All rights reserved.
//

import UIKit




// Lógica para transição de telas que o seu router deve direcionar
@objc protocol ListNewsRouterLogic {
    
    func routeTo(segue: UIStoryboardSegue?)

}


// Dados que você deseja passar nas segues
protocol ListNewsPassInputs {
    
    var dataStore: ListNewsDataStore? { get }
}

class ListNewsRouter: NSObject, ListNewsRouterLogic, ListNewsPassInputs  {
    weak var viewController : ListNewsViewController?
    var dataStore: ListNewsDataStore?
    
    
    func routeTo(segue: UIStoryboardSegue?) {
        
    }
    
}
