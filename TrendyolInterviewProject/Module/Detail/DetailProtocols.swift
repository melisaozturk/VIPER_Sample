//
//  DetailProtocols.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 8.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//


import Foundation
import UIKit

protocol DetailViewToPresenterProtocol: class{
    
    var view: DetailPresenterToViewProtocol? {get set}
    var interactor: DetailPresenterToInteractorProtocol? {get set}
    var wireframe: DetailPresenterToWireframeProtocol? {get set}
//    func startFetchingData()
    func back(navigationConroller:UINavigationController)
}

protocol DetailPresenterToViewProtocol: class{
//    func showDetail(listArray: [listResponse])
//    func showError()
}

protocol DetailPresenterToWireframeProtocol: class {
    static func createDetailModule(data: Any) -> DetailViewController
    func back(navigationConroller:UINavigationController)
}

protocol DetailPresenterToInteractorProtocol: class {
    var presenter:DetailInteractorToPresenterProtocol? {get set}
//    func getData()
}

protocol DetailInteractorToPresenterProtocol: class {
//    func listFetchedSuccess(listModelArray: [listResponse])
//    func listFetchFailed()
}

