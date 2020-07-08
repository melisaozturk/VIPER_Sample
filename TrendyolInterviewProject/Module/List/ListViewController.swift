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
    
    var listArray = [listResponse]()
    var cellArray = ["ProductSliderCell", "SingleBannerCell"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //        UIManager.shared().showLoading(view: self.view)
        presenter?.startFetchingData()
        self.tableRegister()
        self.navigationRegister()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(goDetail(_:)), name: Notification.Name("CellSelect"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func goDetail(_ notification: Notification) {
             if let dict = notification.userInfo as NSDictionary? {
                    if let data = dict["Select"] as? Bool {
                        if data {
                            presenter?.showDetailController(navigationController: navigationController!)
                        }
                        }
                    }
                }
    
    private func navigationRegister() {
    }
    
    private func tableRegister() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none

        tableView.register(UINib(nibName: "ProductSliderCell", bundle: nil), forCellReuseIdentifier: "ProductSliderCell")
        tableView.register(UINib(nibName: "SingleBannerCell", bundle: nil), forCellReuseIdentifier: "SingleBannerCell")
    }
       
}


extension ListViewController:PresenterToViewProtocol{
    
    func showList(listArray: [listResponse]) {

        self.listArray = listArray
//        UIManager.shared().removeLoading(view: self.view)
//            self.tableView.reloadData()
        NotificationCenter.default.post(name: Notification.Name("listData"), object: nil, userInfo: ["listArray":listArray])
        
    }
    
    func showError() {
        DispatchQueue.main.async {
            
            //        UIManager.shared().removeLoading(view: self.view)
            let alert = UIAlertController(title: "Alert", message: "Problem Fetching List", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            //        self.tableView.backgroundView?.backgroundColor = .clear
            //        self.present(alert, animated: true, completion: nil)
//            self.parent?.addChild(alert)
            self.navigationController?.pushViewController(alert, animated: true)
        }
    }
    
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        if cellArray[indexPath.row] == "ProductSliderCell" {
            cell = tableView.dequeueReusableCell(withIdentifier: "ProductSliderCell", for: indexPath) as! ProductSliderCell
        } else if cellArray[indexPath.row] == "SingleBannerCell" {
            cell = tableView.dequeueReusableCell(withIdentifier: "SingleBannerCell", for: indexPath) as! SingleBannerCell
        }
        return cell == nil ? UITableViewCell() : cell!
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
}

