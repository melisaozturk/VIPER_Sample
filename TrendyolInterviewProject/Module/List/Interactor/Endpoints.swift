//
//  Endpoints.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 6.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import Foundation

enum Endpoints {
    case widget
}

extension Endpoints: Endpoint {
    
    var base: String {
        return "https://api.trendyol.com"
        
    }
//    https://api.trendyol.com/zeus/widget/display?widgetPageName=interview
    var path: String {
        switch self {
        case .widget: return "/zeus/widget/display"
        }
    }
        
    var queryItem: [URLQueryItem] {
        switch self {
        case .widget:
            return [URLQueryItem(name: "widgetPageName", value:"interview")]
        }
    }
    
}
