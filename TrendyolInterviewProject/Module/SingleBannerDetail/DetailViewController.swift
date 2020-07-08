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
    
    @IBOutlet weak var productListingCollectionView: UICollectionView!
    
    
    var bannerContent: [BannerContent]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCollection()
    }
    
    private func registerCollection() {
        self.productListingCollectionView.register(UINib(nibName: "ProductListCell", bundle: Bundle.main), forCellWithReuseIdentifier: "ProductListCell")
        
            self.productListingCollectionView.delegate = self
            self.productListingCollectionView.dataSource = self
    }
}

extension DetailViewController: DetailPresenterToViewProtocol{
}


extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let contents = bannerContent {
            return contents.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductListCell", for: indexPath) as! ProductListCell
                
        if let content = self.bannerContent {
            let url = URL(string: content[indexPath.row].imageUrl!)
                cell.imgProduct.kf.setImage(with: url)
//            cell.lblTitle.text = contents[indexPath.row].marketing
        }
        
        
        return cell
    }    
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.productListingCollectionView.frame.width / 2, height: self.productListingCollectionView.frame.height / 2)
    }
}

