//
//  Protocols.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 6.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var wireframe: PresenterToWireframeProtocol? {get set}
    func startFetchingData()
    func showDetailController(navigationController:UINavigationController)
    func back(navigationConroller:UINavigationController)
}

protocol PresenterToViewProtocol: class{
    func showNotice(listArray:Array<listResponse>)
    func showError()
}

protocol PresenterToWireframeProtocol: class {
    static func createListModule() -> ListViewController
    func pushToDetailPage(navigationConroller:UINavigationController)
    func back(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func getData()
}

protocol InteractorToPresenterProtocol: class {
    func noticeFetchedSuccess(noticeModelArray:Array<listResponse>)
    func noticeFetchFailed()
}
