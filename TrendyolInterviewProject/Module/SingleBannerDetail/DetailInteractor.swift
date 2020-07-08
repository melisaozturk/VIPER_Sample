//
//  DetailInteractor.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 8.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//


import Foundation

class DetailInteractor: DetailPresenterToInteractorProtocol {
    weak var presenter: DetailInteractorToPresenterProtocol?
}



//
//class DetailInteractor: ApiClient, DetailPresenterToInteractorProtocol {
//
//    var presenter: DetailInteractorToPresenterProtocol?
//
//    let session: URLSession
//
//    init(configuration: URLSessionConfiguration) {
//        self.session = URLSession(configuration: configuration)
//    }
//
//    convenience init() {
//        self.init(configuration: .default)
//    }
//
//    func getData() {
//        getFeed(from: .widget, completion: { response in
//            switch response {
//            case .success(let successResponse):
//                guard let results = successResponse.self else {return}
//                #if DEBUG
//                print(results)
//                #endif
//                self.presenter?.listFetchedSuccess(listModelArray: [results])
//            case .failure( _):
//                self.presenter?.listFetchFailed()
//                #if DEBUG
//                print("List Fetch Failed")
//                #endif
//            }
//        })
//    }
//
//    private func getFeed(from endpointType: Endpoints, completion: @escaping (Result<listResponse?, APIError>) -> Void) {
//
//        let endpoint = endpointType
//        let request = endpoint.request
//        #if DEBUG
//        print(request)
//        #endif
//
//        fetch(with: request, decode: { json -> listResponse? in
//            guard let feedResult = json as? listResponse else { return  nil }
//            return feedResult
//        }, completion: completion)
//    }
//}
//
