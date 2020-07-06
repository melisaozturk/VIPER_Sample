//
//  ListModel.swift
//  TrendyolInterviewProject
//
//  Created by melisa öztürk on 6.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import Foundation

typealias listResponse = [Widget]

struct Widget: Decodable {

        let bannerContents : [BannerContent]?
        let displayCount : Int?
        let displayOptions : DisplayOption?
        let displayOrder : Int?
        let displayType : String?
        let endDate : String?
        let eventKey : String?
        let id : Int?
        let marketing : Marketing2?
        let products : [Product]?
        let startDate : String?
        let title : String?
        let type : String?
        let widgetNavigation : WidgetNavigation?

        enum CodingKeys: String, CodingKey {
                case bannerContents = "bannerContents"
                case displayCount = "displayCount"
                case displayOptions = "displayOptions"
                case displayOrder = "displayOrder"
                case displayType = "displayType"
                case endDate = "endDate"
                case eventKey = "eventKey"
                case id = "id"
                case marketing = "marketing"
                case products = "products"
                case startDate = "startDate"
                case title = "title"
                case type = "type"
                case widgetNavigation = "widgetNavigation"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                bannerContents = try values.decodeIfPresent([BannerContent].self, forKey: .bannerContents)
                displayCount = try values.decodeIfPresent(Int.self, forKey: .displayCount)
                displayOptions = try DisplayOption(from: decoder)
                displayOrder = try values.decodeIfPresent(Int.self, forKey: .displayOrder)
                displayType = try values.decodeIfPresent(String.self, forKey: .displayType)
                endDate = try values.decodeIfPresent(String.self, forKey: .endDate)
                eventKey = try values.decodeIfPresent(String.self, forKey: .eventKey)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                marketing = try Marketing2(from: decoder)
                products = try values.decodeIfPresent([Product].self, forKey: .products)
                startDate = try values.decodeIfPresent(String.self, forKey: .startDate)
                title = try values.decodeIfPresent(String.self, forKey: .title)
                type = try values.decodeIfPresent(String.self, forKey: .type)
                widgetNavigation = try WidgetNavigation(from: decoder)
        }

}

struct WidgetNavigation : Decodable {

        let deeplink : String?
        let id : Int?
        let landingTitle : String?
        let navigationType : String?

        enum CodingKeys: String, CodingKey {
                case deeplink = "deeplink"
                case id = "id"
                case landingTitle = "landingTitle"
                case navigationType = "navigationType"
        }

        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                deeplink = try values.decodeIfPresent(String.self, forKey: .deeplink)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                landingTitle = try values.decodeIfPresent(String.self, forKey: .landingTitle)
                navigationType = try values.decodeIfPresent(String.self, forKey: .navigationType)
        }

}

struct Product : Decodable {

        let averageRating : Float?
        let boutiqueId : Int?
        let brandName : String?
        let businessUnit : String?
        let categoryHierarchy : String?
        let categoryName : String?
        let colorId : Int?
        let colorName : String?
        let contentId : Int?
        let discountedPrice : Float?
        let discountedPriceInfo : String?
        let discountPercentage : String?
        let freeCargo : Bool?
        let hasScheduledDelivery : Bool?
        let id : Int?
        let imageUrl : String?
        let imageUrls : [String]?
        let isDirectCartAdditionAvailable : Bool?
        let isGroupColorOptionsActive : Bool?
        let mainId : Int?
        let marketing : ProductMarketing?
        let marketPrice : Float?
        let merchantId : Int?
        let mOriginalPrice : Float?
        let name : String?
        let promotionList : [PromotionList]?
        let promotionMessage : String?
        let promotions : [String]?
        let ratingCount : Int?
        let rushDelivery : Bool?
        let salePrice : Float?
        let stamps : [String]?
        let stockStatus : Int?
        let variants : [Variant]?

        enum CodingKeys: String, CodingKey {
                case averageRating = "averageRating"
                case boutiqueId = "boutiqueId"
                case brandName = "brandName"
                case businessUnit = "businessUnit"
                case categoryHierarchy = "categoryHierarchy"
                case categoryName = "categoryName"
                case colorId = "colorId"
                case colorName = "colorName"
                case contentId = "contentId"
                case discountedPrice = "discountedPrice"
                case discountedPriceInfo = "discountedPriceInfo"
                case discountPercentage = "discountPercentage"
                case freeCargo = "freeCargo"
                case hasScheduledDelivery = "hasScheduledDelivery"
                case id = "id"
                case imageUrl = "imageUrl"
                case imageUrls = "imageUrls"
                case isDirectCartAdditionAvailable = "isDirectCartAdditionAvailable"
                case isGroupColorOptionsActive = "isGroupColorOptionsActive"
                case mainId = "mainId"
                case marketing = "marketing"
                case marketPrice = "marketPrice"
                case merchantId = "merchantId"
                case mOriginalPrice = "mOriginalPrice"
                case name = "name"
                case promotionList = "promotionList"
                case promotionMessage = "promotionMessage"
                case promotions = "promotions"
                case ratingCount = "ratingCount"
                case rushDelivery = "rushDelivery"
                case salePrice = "salePrice"
                case stamps = "stamps"
                case stockStatus = "stockStatus"
                case variants = "variants"
        }

        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                averageRating = try values.decodeIfPresent(Float.self, forKey: .averageRating)
                boutiqueId = try values.decodeIfPresent(Int.self, forKey: .boutiqueId)
                brandName = try values.decodeIfPresent(String.self, forKey: .brandName)
                businessUnit = try values.decodeIfPresent(String.self, forKey: .businessUnit)
                categoryHierarchy = try values.decodeIfPresent(String.self, forKey: .categoryHierarchy)
                categoryName = try values.decodeIfPresent(String.self, forKey: .categoryName)
                colorId = try values.decodeIfPresent(Int.self, forKey: .colorId)
                colorName = try values.decodeIfPresent(String.self, forKey: .colorName)
                contentId = try values.decodeIfPresent(Int.self, forKey: .contentId)
                discountedPrice = try values.decodeIfPresent(Float.self, forKey: .discountedPrice)
                discountedPriceInfo = try values.decodeIfPresent(String.self, forKey: .discountedPriceInfo)
                discountPercentage = try values.decodeIfPresent(String.self, forKey: .discountPercentage)
                freeCargo = try values.decodeIfPresent(Bool.self, forKey: .freeCargo)
                hasScheduledDelivery = try values.decodeIfPresent(Bool.self, forKey: .hasScheduledDelivery)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
                imageUrls = try values.decodeIfPresent([String].self, forKey: .imageUrls)
                isDirectCartAdditionAvailable = try values.decodeIfPresent(Bool.self, forKey: .isDirectCartAdditionAvailable)
                isGroupColorOptionsActive = try values.decodeIfPresent(Bool.self, forKey: .isGroupColorOptionsActive)
                mainId = try values.decodeIfPresent(Int.self, forKey: .mainId)
                marketing = try ProductMarketing(from: decoder)
                marketPrice = try values.decodeIfPresent(Float.self, forKey: .marketPrice)
                merchantId = try values.decodeIfPresent(Int.self, forKey: .merchantId)
                mOriginalPrice = try values.decodeIfPresent(Float.self, forKey: .mOriginalPrice)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                promotionList = try values.decodeIfPresent([PromotionList].self, forKey: .promotionList)
                promotionMessage = try values.decodeIfPresent(String.self, forKey: .promotionMessage)
                promotions = try values.decodeIfPresent([String].self, forKey: .promotions)
                ratingCount = try values.decodeIfPresent(Int.self, forKey: .ratingCount)
                rushDelivery = try values.decodeIfPresent(Bool.self, forKey: .rushDelivery)
                salePrice = try values.decodeIfPresent(Float.self, forKey: .salePrice)
                stamps = try values.decodeIfPresent([String].self, forKey: .stamps)
                stockStatus = try values.decodeIfPresent(Int.self, forKey: .stockStatus)
                variants = try values.decodeIfPresent([Variant].self, forKey: .variants)
        }

}

struct Variant : Decodable {

        let campaignId : Int?
        let listingId : String?
        let name : String?
        let price : Price?
        let value : String?
        let variantId : Int?

        enum CodingKeys: String, CodingKey {
                case campaignId = "campaignId"
                case listingId = "listingId"
                case name = "name"
                case price = "price"
                case value = "value"
                case variantId = "variantId"
        }

        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                campaignId = try values.decodeIfPresent(Int.self, forKey: .campaignId)
                listingId = try values.decodeIfPresent(String.self, forKey: .listingId)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                price = try Price(from: decoder)
                value = try values.decodeIfPresent(String.self, forKey: .value)
                variantId = try values.decodeIfPresent(Int.self, forKey: .variantId)
        }

}

struct Price : Decodable {

        let marketPrice : Float?
        let salePrice : Float?

        enum CodingKeys: String, CodingKey {
                case marketPrice = "marketPrice"
                case salePrice = "salePrice"
        }

        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                marketPrice = try values.decodeIfPresent(Float.self, forKey: .marketPrice)
                salePrice = try values.decodeIfPresent(Float.self, forKey: .salePrice)
        }

}

struct PromotionList: Decodable {

        let name : String?
        let type : String?

        enum CodingKeys: String, CodingKey {
                case name = "name"
                case type = "type"
        }

        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                type = try values.decodeIfPresent(String.self, forKey: .type)
        }

}

struct ProductMarketing: Decodable {

        let delphoi : Delphoi1?
        let enhanced : Enhanced?
        let facebook : Facebook?

        enum CodingKeys: String, CodingKey {
                case delphoi = "delphoi"
                case enhanced = "enhanced"
                case facebook = "facebook"
        }

        init(from decoder: Decoder) throws {
                delphoi = try Delphoi1(from: decoder)
                enhanced = try Enhanced(from: decoder)
                facebook = try Facebook(from: decoder)
        }

}

struct Facebook : Decodable {

        let id : String?
        let itemPrice : String?
        let productBoutiqueid : String?
        let productContentid : String?
        let productItemnumber : String?
        let productListingid : String?
        let productMerchantid : String?
        let quantity : String?

        enum CodingKeys: String, CodingKey {
                case id = "id"
                case itemPrice = "item_price"
                case productBoutiqueid = "product_boutiqueid"
                case productContentid = "product_contentid"
                case productItemnumber = "product_itemnumber"
                case productListingid = "product_listingid"
                case productMerchantid = "product_merchantid"
                case quantity = "quantity"
        }

        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                id = try values.decodeIfPresent(String.self, forKey: .id)
                itemPrice = try values.decodeIfPresent(String.self, forKey: .itemPrice)
                productBoutiqueid = try values.decodeIfPresent(String.self, forKey: .productBoutiqueid)
                productContentid = try values.decodeIfPresent(String.self, forKey: .productContentid)
                productItemnumber = try values.decodeIfPresent(String.self, forKey: .productItemnumber)
                productListingid = try values.decodeIfPresent(String.self, forKey: .productListingid)
                productMerchantid = try values.decodeIfPresent(String.self, forKey: .productMerchantid)
                quantity = try values.decodeIfPresent(String.self, forKey: .quantity)
        }

}

struct Enhanced: Decodable {

        let dimension140 : String?
        let dimension141 : String?
        let dimension142 : String?
        let dimension143 : String?
        let dimension145 : String?
        let dimension146 : String?
        let dimension147 : String?
        let dimension149 : String?
        let dimension152 : String?
        let dimension155 : String?
        let dimension156 : String?

        enum CodingKeys: String, CodingKey {
                case dimension140 = "dimension140"
                case dimension141 = "dimension141"
                case dimension142 = "dimension142"
                case dimension143 = "dimension143"
                case dimension145 = "dimension145"
                case dimension146 = "dimension146"
                case dimension147 = "dimension147"
                case dimension149 = "dimension149"
                case dimension152 = "dimension152"
                case dimension155 = "dimension155"
                case dimension156 = "dimension156"
        }

        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                dimension140 = try values.decodeIfPresent(String.self, forKey: .dimension140)
                dimension141 = try values.decodeIfPresent(String.self, forKey: .dimension141)
                dimension142 = try values.decodeIfPresent(String.self, forKey: .dimension142)
                dimension143 = try values.decodeIfPresent(String.self, forKey: .dimension143)
                dimension145 = try values.decodeIfPresent(String.self, forKey: .dimension145)
                dimension146 = try values.decodeIfPresent(String.self, forKey: .dimension146)
                dimension147 = try values.decodeIfPresent(String.self, forKey: .dimension147)
                dimension149 = try values.decodeIfPresent(String.self, forKey: .dimension149)
                dimension152 = try values.decodeIfPresent(String.self, forKey: .dimension152)
                dimension155 = try values.decodeIfPresent(String.self, forKey: .dimension155)
                dimension156 = try values.decodeIfPresent(String.self, forKey: .dimension156)
        }

}

struct Delphoi1: Decodable {

        let tv067 : String?

        enum CodingKeys: String, CodingKey {
                case tv067 = "tv067"
        }

        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                tv067 = try values.decodeIfPresent(String.self, forKey: .tv067)
        }

}

struct Marketing2: Decodable {

        let delphoi : Delphoi2?

        enum CodingKeys: String, CodingKey {
                case delphoi = "delphoi"
        }

        init(from decoder: Decoder) throws {
                delphoi = try Delphoi2(from: decoder)
        }

}

struct Delphoi2: Decodable {

        let tv070 : String?
        let tv072 : String?
        let tv073 : String?
        let tv097 : String?

        enum CodingKeys: String, CodingKey {
                case tv070 = "tv070"
                case tv072 = "tv072"
                case tv073 = "tv073"
                case tv097 = "tv097"
        }

        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                tv070 = try values.decodeIfPresent(String.self, forKey: .tv070)
                tv072 = try values.decodeIfPresent(String.self, forKey: .tv072)
                tv073 = try values.decodeIfPresent(String.self, forKey: .tv073)
                tv097 = try values.decodeIfPresent(String.self, forKey: .tv097)
        }

}

struct DisplayOption: Decodable {

        let paddingRightLeft : Int?
        let paddingTopBottom : Int?
        let showClearButton : Bool?
        let showCountdown : Bool?
        let showProductFavoredButton : Bool?
        let showProductPrice : Bool?

        enum CodingKeys: String, CodingKey {
                case paddingRightLeft = "paddingRightLeft"
                case paddingTopBottom = "paddingTopBottom"
                case showClearButton = "showClearButton"
                case showCountdown = "showCountdown"
                case showProductFavoredButton = "showProductFavoredButton"
                case showProductPrice = "showProductPrice"
        }

        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                paddingRightLeft = try values.decodeIfPresent(Int.self, forKey: .paddingRightLeft)
                paddingTopBottom = try values.decodeIfPresent(Int.self, forKey: .paddingTopBottom)
                showClearButton = try values.decodeIfPresent(Bool.self, forKey: .showClearButton)
                showCountdown = try values.decodeIfPresent(Bool.self, forKey: .showCountdown)
                showProductFavoredButton = try values.decodeIfPresent(Bool.self, forKey: .showProductFavoredButton)
                showProductPrice = try values.decodeIfPresent(Bool.self, forKey: .showProductPrice)
        }

}

struct BannerContent: Decodable {

        let bannerEventKey : String?
        let bannerPosition : String?
        let displayOrder : Int?
        let height : Int?
        let imageUrl : String?
        let marketing : Marketing3?
        let navigation : Navigation?
        let width : Int?

        enum CodingKeys: String, CodingKey {
                case bannerEventKey = "bannerEventKey"
                case bannerPosition = "bannerPosition"
                case displayOrder = "displayOrder"
                case height = "height"
                case imageUrl = "imageUrl"
                case marketing = "marketing"
                case navigation = "navigation"
                case width = "width"
        }

        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                bannerEventKey = try values.decodeIfPresent(String.self, forKey: .bannerEventKey)
                bannerPosition = try values.decodeIfPresent(String.self, forKey: .bannerPosition)
                displayOrder = try values.decodeIfPresent(Int.self, forKey: .displayOrder)
                height = try values.decodeIfPresent(Int.self, forKey: .height)
                imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
                marketing = try Marketing3(from: decoder)
                navigation = try Navigation(from: decoder)
                width = try values.decodeIfPresent(Int.self, forKey: .width)
        }

}

struct Navigation : Decodable {

        let deeplink : String?
        let id : Int?
        let landingTitle : String?
        let navigationType : String?
        let title : String?

        enum CodingKeys: String, CodingKey {
                case deeplink = "deeplink"
                case id = "id"
                case landingTitle = "landingTitle"
                case navigationType = "navigationType"
                case title = "title"
        }

        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                deeplink = try values.decodeIfPresent(String.self, forKey: .deeplink)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                landingTitle = try values.decodeIfPresent(String.self, forKey: .landingTitle)
                navigationType = try values.decodeIfPresent(String.self, forKey: .navigationType)
                title = try values.decodeIfPresent(String.self, forKey: .title)
        }

}

struct Marketing3 : Decodable {

        let delphoi: Delphoi3?

        enum CodingKeys: String, CodingKey {
                case delphoi = "delphoi"
        }

        init(from decoder: Decoder) throws {
                delphoi = try Delphoi3(from: decoder)
        }

}

struct Delphoi3 : Decodable {

        let tv067 : String?
        let tv068 : String?
        let tv069 : String?
        let tv070 : String?
        let tv072 : String?
        let tv073 : String?
        let tv097 : String?

        enum CodingKeys: String, CodingKey {
                case tv067 = "tv067"
                case tv068 = "tv068"
                case tv069 = "tv069"
                case tv070 = "tv070"
                case tv072 = "tv072"
                case tv073 = "tv073"
                case tv097 = "tv097"
        }

        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                tv067 = try values.decodeIfPresent(String.self, forKey: .tv067)
                tv068 = try values.decodeIfPresent(String.self, forKey: .tv068)
                tv069 = try values.decodeIfPresent(String.self, forKey: .tv069)
                tv070 = try values.decodeIfPresent(String.self, forKey: .tv070)
                tv072 = try values.decodeIfPresent(String.self, forKey: .tv072)
                tv073 = try values.decodeIfPresent(String.self, forKey: .tv073)
                tv097 = try values.decodeIfPresent(String.self, forKey: .tv097)
        }

}
