//
//  DetailViewController.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 8.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    weak var presenter: DetailViewToPresenterProtocol?
    
    var contents: [BannerContent]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnBack(_ sender: Any) {
          self.presenter?.back(navigationConroller: navigationController!)
    }
}

extension DetailViewController: DetailPresenterToViewProtocol{
}
