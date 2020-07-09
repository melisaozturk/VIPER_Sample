//
//  DetailPresenter.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 8.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//


import Foundation
import UIKit

class DetailPresenter: DetailViewToPresenterProtocol {
   
    var view: DetailPresenterToViewProtocol?
    var interactor: DetailPresenterToInteractorProtocol?
    var wireframe: DetailPresenterToWireframeProtocol?
    
}

extension DetailPresenter: DetailInteractorToPresenterProtocol {
}

