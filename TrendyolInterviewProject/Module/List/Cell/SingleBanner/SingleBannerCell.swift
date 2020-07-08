//
//  SingleBannerCell.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 7.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit
import Kingfisher

class SingleBannerCell: UITableViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var contents = [BannerContent]()    

    override func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(self, selector: #selector(getData(_:)), name: NSNotification.Name(rawValue: "listData"), object: nil)

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }        
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
        @objc func getData(_ notification: Notification) {
            if let dict = notification.userInfo as NSDictionary? {
                if let data = dict["listArray"] as? [listResponse] {
                    for item in data {
                        for data in item.widgets {
                            if data.displayType == "SINGLE" && data.type == "BANNER" {
                                if data.bannerContents != nil {
                                    self.contents = data.bannerContents!
                                    self.setData()
                                }
                            }
                        }
                    }
                }
            }
        }
    
    func setData() {
        for content in self.contents {
            let url = URL(string: content.imageUrl!)
            imgProduct.kf.setImage(with: url)
            lblTitle.text = content.navigation!.title
        }
    }
}
