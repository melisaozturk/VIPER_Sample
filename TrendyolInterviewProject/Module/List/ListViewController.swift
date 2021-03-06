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
    
    var widgets = [Widget]()
    var cellArray = ["SingleBannerCell", "ProductSliderCell"]
    var singleBannerContents = [BannerContent]()
    var productSliderWidget = [Widget]()
    var titles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
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
            if let row = dict["SelectedCell"] as? Int {
                for widget in self.productSliderWidget {
                    if let products = widget.products {
                        presenter?.showDetailController(navigationController: navigationController!, data: products[row])
                    }
                    break
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
    
    private func getRowCount() {
        if !self.widgets.isEmpty {
            for widget in self.widgets {
                if widget.displayType == "SINGLE" && widget.type == "BANNER" {
                    self.titles.append(widget.title!)
                    if let bannerContent = widget.bannerContents {
                        self.singleBannerContents.append(contentsOf: bannerContent)
                    }
                }
                
                if widget.displayType == "SLIDER" && widget.type == "PRODUCT" {
                    self.productSliderWidget.append(widget)
                }
            }
            
        }
    }
}


extension ListViewController:PresenterToViewProtocol{
    
    func showList(listArray: [listResponse]) {
        
        for item in listArray {
            self.widgets = item.widgets
        }
        self.getRowCount()
        self.tableView.reloadData()
        
        UIManager.shared().removeLoading(view: self.view)
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
        switch section {
        case 0:
            return 1
        case 1:
            return self.singleBannerContents.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "ProductSliderCell", for: indexPath) as! ProductSliderCell
            if !self.productSliderWidget.isEmpty {
                if let products = self.productSliderWidget[indexPath.row].products {
                    (cell as! ProductSliderCell).products = products
                    (cell as! ProductSliderCell).lblHeader.text = self.productSliderWidget[indexPath.row].title
                    (cell as! ProductSliderCell).collectionView.reloadData()
                }
            }
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "SingleBannerCell", for: indexPath) as! SingleBannerCell
            if !self.singleBannerContents.isEmpty {
                let url = URL(string: self.singleBannerContents[indexPath.row].imageUrl!)
                (cell as! SingleBannerCell).imgProduct.kf.setImage(with: url)
                (cell as! SingleBannerCell).lblTitle.text =  self.singleBannerContents[indexPath.row].navigation!.title
                (cell as! SingleBannerCell).lblHeader.text = self.titles[indexPath.row]
            }
        default:
            cell = UITableViewCell()
        }
        cell?.selectionStyle = .none
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
        case 1:
            if !singleBannerContents.isEmpty {
                if let contentHeight = singleBannerContents[indexPath.row].height {
                    return CGFloat(contentHeight)
                }
            }
        default:
            return 200
        }
        return 200
    }
    
}

