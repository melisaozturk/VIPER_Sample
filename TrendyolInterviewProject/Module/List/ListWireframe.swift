//
//  ListWireframe.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 6.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import Foundation
import UIKit

class ListWireframe: PresenterToWireframeProtocol {
  
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createListModule() -> ListViewController {
        let listVC = mainStoryboard.instantiateViewController(identifier: "ListViewController") as! ListViewController
        
        let interactor: PresenterToInteractorProtocol = ListInteractor()
        let wireframe: PresenterToWireframeProtocol = ListWireframe()
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = ListPresenter()
        
        listVC.presenter = presenter
        presenter.wireframe = wireframe
        presenter.view = listVC
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return listVC
    }
//    TODO:
    func pushToDetailPage(navigationConroller: UINavigationController) {
//        let detailModule = detailWireframe.createDetailModule()
//        navigationController.pushViewController(detailModule,animated: true)
    }
    
    func back(navigationConroller:UINavigationController) {
        navigationConroller.popViewController(animated: true)
       }
}

