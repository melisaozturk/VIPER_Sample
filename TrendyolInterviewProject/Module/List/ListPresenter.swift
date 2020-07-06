//
//  ListPresenter.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 6.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import Foundation
import UIKit

class ListPresenter: ViewToPresenterProtocol {
   
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var wireframe: PresenterToWireframeProtocol?
    
    func startFetchingData() {
        interactor?.getData()
    }
    
    func showDetailController(navigationController: UINavigationController) {
        wireframe?.pushToDetailPage(navigationConroller:navigationController)
    }
    
    func back(navigationConroller: UINavigationController) {
        wireframe?.back(navigationConroller: navigationConroller)
    }
}

extension ListPresenter: InteractorToPresenterProtocol {
    func listFetchedSuccess(listModelArray: [listResponse]) {
        view?.showList(listArray: listModelArray)
    }
    
    func listFetchFailed() {
        view?.showError()
    }
    
    
}
