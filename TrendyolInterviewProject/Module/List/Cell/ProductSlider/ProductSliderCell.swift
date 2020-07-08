//
//  ProductSliderCell.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 6.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit
import Kingfisher

class ProductSliderCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var products = [Product]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       collectionRegister()
//        NotificationCenter.default.addObserver(self, selector: #selector(getData(_:)), name: NSNotification.Name(rawValue: "listData"), object: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//
    
//    @objc func getData(_ notification: Notification) {
//        if let dict = notification.userInfo as NSDictionary? {
//            if let data = dict["listArray"] as? [Widget] {
//                for item in data {
//                        if item.displayType == "SLIDER" && item.type == "PRODUCT" {
//                            if item.products != nil {
//                                self.products = item.products!
//                        }
//                    }
//                }
//                self.collectionView.reloadData()
//            }
//        }
//    }
    
    private func collectionRegister() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ProductSliderInternalCell", bundle: nil), forCellWithReuseIdentifier: "ProductSliderInternalCell")
    }
}

extension ProductSliderCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductSliderInternalCell", for: indexPath) as! ProductSliderInternalCell
                
        let url = URL(string: self.products[indexPath.row].imageUrl!)
        cell.imgContent.kf.setImage(with: url)
        cell.lblTitle.text = self.products[indexPath.row].name!
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "CellSelect"), object: nil, userInfo: ["SelectedCell": indexPath.row])
    }
}

extension ProductSliderCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.frame.width / 3, height: self.collectionView.frame.height)
    }
}
