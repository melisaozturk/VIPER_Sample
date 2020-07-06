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
                guard let results = photoResponse.self else {return}
                print(results)
                self.presenter?.noticeFetchedSuccess(noticeModelArray: [results])
            case .failure( _):
                self.presenter?.noticeFetchFailed()
                print("Error")
            }
        })
    }
    
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

