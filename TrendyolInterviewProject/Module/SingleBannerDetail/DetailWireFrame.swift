//
//  DetailWireFrame.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 8.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit

class DetailWireframe: DetailPresenterToWireframeProtocol {
  
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createDetailModule(data: Any?) -> DetailViewController {
        let detailVC = mainStoryboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        
        let interactor: DetailPresenterToInteractorProtocol = DetailInteractor()
        let wireframe: DetailPresenterToWireframeProtocol = DetailWireframe()
        let presenter: DetailViewToPresenterProtocol & DetailInteractorToPresenterProtocol = DetailPresenter()
        
        detailVC.presenter = presenter
        presenter.wireframe = wireframe
        presenter.view = detailVC
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        if let contentData = data {
            detailVC.bannerContent = contentData as? [BannerContent]
        }
        
        return detailVC
    }
    
    func back(navigationConroller:UINavigationController) {
        navigationConroller.popViewController(animated: true)
       }
}

