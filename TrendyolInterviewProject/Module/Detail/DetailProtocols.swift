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
}

protocol DetailPresenterToViewProtocol: class{
}

protocol DetailPresenterToWireframeProtocol: class {
    static func createDetailModule(data: Any?) -> DetailViewController
}

protocol DetailPresenterToInteractorProtocol: class {
    var presenter:DetailInteractorToPresenterProtocol? {get set}
}

protocol DetailInteractorToPresenterProtocol: class {
}

