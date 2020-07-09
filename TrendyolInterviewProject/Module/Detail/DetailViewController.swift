//
//  DetailViewController.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 8.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblBrand: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    weak var presenter: DetailViewToPresenterProtocol?
    
    var product: Product?
    var urls: [String]?
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    private func setData() {
        if let product = self.product {
            if let urls = product.imageUrls {
                self.urls = urls
                self.pageControl.numberOfPages = self.urls!.count
                
                for index in 0..<self.urls!.count {
                    frame.origin.x = scrollView.frame.size.width * CGFloat(index)
                    frame.size = scrollView.frame.size
                    
                    let url = URL(string: self.urls![index])
                    let imageView = UIImageView(frame: frame)
                    imageView.kf.setImage(with: url)
                    imageView.contentMode = .scaleAspectFill
                    self.scrollView.addSubview(imageView)
                    
                }
                
                scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(self.urls!.count)), height: scrollView.frame.size.height)
                scrollView.delegate = self
            }
            
            if let brand = product.brandName, let name = product.name, let price = product.marketPrice {
                lblBrand.text = brand
                lblName.text = name
                lblPrice.text = "\(String(price)) TL"
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationSetup()
    }
    
    private func navigationSetup() {
        self.title = "Product Detail"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem =  UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.tintColor = .black
    }
}

extension DetailViewController: DetailPresenterToViewProtocol{
}

extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
        pageControl.isUserInteractionEnabled = false
    }
}
