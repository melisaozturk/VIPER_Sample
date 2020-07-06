//
//  ListViewController.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 6.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    var presenter: ViewToPresenterProtocol?

    @IBOutlet weak var tableView: UITableView!
    
//    var listArray: [String] = ["a"]
    var listArray:Array<listResponse> = Array()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableRegister()
        presenter?.startFetchingData()
    }
    
    private func tableRegister() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: "SingleBannerCell", bundle: nil), forCellReuseIdentifier: "SingleBannerCell")
    }
       
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SingleBannerCell", for: indexPath) as! SingleBannerCell
        
        self.tableView.separatorStyle = .none
//        cell.listArray.append(self.listArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetailController(navigationController: navigationController!)
    }
}

extension ListViewController:PresenterToViewProtocol{
    
    func showList(listArray: Array<listResponse>) {

        self.listArray = listArray
//        self.tableView.reloadData()
//        hideProgressIndicator(view: self.view)
        
    }
    
    func showError() {

//        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching List", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}
