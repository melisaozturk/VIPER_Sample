//
//  ListViewController.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 6.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    weak var presenter: ViewToPresenterProtocol?
//    var listArray: [String] = ["a"]
    var listArray = [listResponse]()
    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)!
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
//        self.tableView.isHidden = true
        self.tableView.backgroundView?.backgroundColor = .clear
//        UIManager.shared().showLoading(view: self.view)
        presenter?.startFetchingData()
        self.tableRegister()
        self.navigationRegister()
    }
    
    private func navigationRegister() {
//        self.navigationController?.navigationBar.topItem?.title = "Trendyol"
//        self.navigationBar.topItem?.title = "Trendyol"
    }
    
    private func tableRegister() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none

        tableView.register(UINib(nibName: "ProductSliderCell", bundle: nil), forCellReuseIdentifier: "ProductSliderCell")
    }
       
}


extension ListViewController:PresenterToViewProtocol{
    
    func showList(listArray: [listResponse]) {

        self.listArray = listArray
//        UIManager.shared().removeLoading(view: self.view)
            self.tableView.reloadData()
        NotificationCenter.default.post(name: Notification.Name("listData"), object: nil, userInfo: ["listArray":listArray])//listArray.map({$0.widgets})]
            
    }
    
    func showError() {
//        DispatchQueue.main.async {
//
////        UIManager.shared().removeLoading(view: self.view)
//        let alert = UIAlertController(title: "Alert", message: "Problem Fetching List", preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
////        self.tableView.backgroundView?.backgroundColor = .clear
////        self.present(alert, animated: true, completion: nil)
//            self.parent?.addChild(alert)
//        }
    }
    
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductSliderCell", for: indexPath) as! ProductSliderCell
//        cell.collectionView.reloadData()
                
        return cell
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 400
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension//200
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 200
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            presenter?.showDetailController(navigationController: navigationController!)
    }
}

