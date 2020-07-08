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
    
//    var listArray = [listResponse]()
    var widgets = [Widget]()
    var cellArray = ["SingleBannerCell", "ProductSliderCell"]
    let headerSingleBanner = Header()
    let headerProductSlider = Header()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIManager.shared().showLoading(view: self.view)
        presenter?.startFetchingData()
        self.tableRegister()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(goDetail(_:)), name: Notification.Name("CellSelect"), object: nil)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func goDetail(_ notification: Notification) {
        if let dict = notification.userInfo as NSDictionary? {
            if let data = dict["Select"] as? Bool {
                if data {
                    presenter?.showDetailController(navigationController: navigationController!, data: widgets)
                    
                }
            }
        }
    }
    
    
    private func tableRegister() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: "SingleBannerCell", bundle: nil), forCellReuseIdentifier: "SingleBannerCell")
        tableView.register(UINib(nibName: "ProductSliderCell", bundle: nil), forCellReuseIdentifier: "ProductSliderCell")
    }
    
}


extension ListViewController:PresenterToViewProtocol{
    
    func showList(listArray: [listResponse]) {
        
        for item in listArray {
            self.widgets = item.widgets
        }
        self.tableView.reloadData()

        UIManager.shared().removeLoading(view: self.view)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "listData"), object: nil, userInfo: ["listArray":widgets])
    }
    
    func showError() {
        
        UIManager.shared().removeLoading(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching List", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _  in
            exit(0)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "SingleBannerCell", for: indexPath) as! SingleBannerCell
            if !self.widgets.isEmpty {
                for widget in self.widgets {
                    if widget.displayType == "SINGLE" && widget.type == "BANNER" {
                        headerSingleBanner.lblHeader.text = widget.title
                    }
                }
            }
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "ProductSliderCell", for: indexPath) as! ProductSliderCell
            if !self.widgets.isEmpty {
                for widget in self.widgets {
                    if widget.displayType == "SLIDER" && widget.type == "PRODUCT" {
                        headerProductSlider.lblHeader.text = widget.title
                    }
                }
            }
        default:
            cell = UITableViewCell()
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for data in self.widgets {
            if let contents = data.bannerContents {
                presenter?.showDetailController(navigationController: navigationController!, data: contents)
                break
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        case 0:
            return headerSingleBanner
        case 1:
            return headerProductSlider
        default:
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

