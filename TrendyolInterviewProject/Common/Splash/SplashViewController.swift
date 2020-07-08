//
//  SplashViewController.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 8.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        perform(#selector(showView), with: nil, afterDelay: 2)
    }
    
    @objc func showView(){
        let list = ListWireframe.createListModule()
        navigationController!.viewControllers = [list]
    }
}
