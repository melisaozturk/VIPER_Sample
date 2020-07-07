//
//  ProductSliderCell.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 6.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit

class ProductSliderCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
//    var listArray = [listResponse]()
//    var listArray:Array<albumResponse> = Array()
    var widgets = [Widget]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       collectionRegister()
        NotificationCenter.default.addObserver(self, selector: #selector(getData(_:)), name: NSNotification.Name(rawValue: "listData"), object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @objc func getData(_ notifiation: Notification) {
        if let dict = notifiation.userInfo as NSDictionary? {
            if let data = dict["listArray"] as? [listResponse] {
                for item in data {
                    for data in item.widgets {
                        if data.displayType == "SINGLE" && data.type == "BANNER" {
                            self.widgets.append(data)
                        }
                    }
                
//                self.widgets = data.map({$0.widgets[0]})//.filter({($0.displayType?.contains("CAROUSEL"))!})
                    
//                    .map({$0.widgets[0]}).filter {term in
//                    return  (term.type?.contains("BANNER"))! && (term.displayType?.contains("CAROUSEL"))!
                }
                self.collectionView.reloadData()
            }
        }
    }
    
    private func collectionRegister() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ProductSliderInternalCell", bundle: nil), forCellWithReuseIdentifier: "ProductSliderInternalCell")
    }
}

extension ProductSliderCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return widgets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductSliderInternalCell", for: indexPath) as! ProductSliderInternalCell
//        let cellType = listArray![indexPath.row].widgets.map({ (displayType) in
//            displayType.displayType
//        })
        return cell
    }
}

extension ProductSliderCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
}
