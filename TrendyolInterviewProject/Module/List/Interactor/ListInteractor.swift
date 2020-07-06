//
//  ListInteractor.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 6.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import Foundation

class ListInteractor: ApiClient, PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenterProtocol?
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getData() {
        getFeed(from: .widget, completion: { response in
            switch response {
            case .success(let photoResponse):
                guard let photoResults = photoResponse.self else {return}
                print(photoResults)
                self.presenter?.noticeFetchedSuccess(noticeModelArray: [photoResults])
            case .failure( _):
                self.presenter?.noticeFetchFailed()
                print("Error")
            }
        })
    }
    
    //in the signature of the function in the success case we define the Class type thats is the generic one in the API
    private func getFeed(from photoType: Endpoints, completion: @escaping (Result<listResponse?, APIError>) -> Void) {
        
        let endpoint = photoType
        let request = endpoint.request
        print(request)
        fetch(with: request, decode: { json -> listResponse? in
            guard let feedResult = json as? listResponse else { return  nil }
            return feedResult
        }, completion: completion)
    }
}


//
//class ListInteractor: ListEndpoint, PresenterToInteractorProtocol {
//
//    var presenter: InteractorToPresenterProtocol?
//
//    func getData() {
//        getFeed(completion: { response in
//            switch response {
//            case .success(let photoResponse):
//                guard let photoResults = photoResponse.self else {return}
//                self.presenter?.noticeFetchedSuccess(noticeModelArray: [photoResults])
//
//                print(photoResults)
//            case .failure( _):
////                print("Error: \(error)")
//                self.presenter?.noticeFetchFailed()
//            }
//        })
//    }
//
//
//}
//
