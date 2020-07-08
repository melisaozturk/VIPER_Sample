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

        
        let list = ListWireframe.createListModule()

        /* Initiating instance of ui-navigation-controller with view-controller */
        navigationController!.viewControllers = [list]

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
