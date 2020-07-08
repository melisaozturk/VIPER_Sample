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

    func pushToDetailPage(navigationConroller navigationController: UINavigationController, data: Any?) {
        let detailModule = DetailWireframe.createDetailModule(data: data)
//        navigationController.pushViewController(detailModule,animated: true)
//        let nav = UINavigationController(rootViewController: DetailWireframe.createDetailModule())
        navigationController.pushViewController(detailModule,animated: true)
//        present(detailModule, animated: true)        
//        .pushViewController(detailModule,animated: true)
//        present(nav, animated: true)
        
//        navigationController.visibleViewController?.performSegue(withIdentifier: "DetailSegue", sender: nil)

    }
}

