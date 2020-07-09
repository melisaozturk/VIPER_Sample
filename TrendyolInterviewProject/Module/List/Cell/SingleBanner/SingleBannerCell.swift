//
//  SingleBannerCell.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 7.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit

class SingleBannerCell: UITableViewCell {
   
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var contents = [BannerContent]()    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
