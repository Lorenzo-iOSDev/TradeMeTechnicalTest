//
//  Listing.swift
//  TradeMeTechnicalTest
//
//  Created by Lorenzo Zemp on 22/11/21.
//

import Foundation

struct Listing: Decodable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case Title, PictureHref, Region, HasBuyNow, BuyNowPrice, PriceDisplay, IsClassified
        //Maps JSON key "ListingId" to swift property "id"
        //mapping to "id" so that Listing can conform to Identifiable
        case id = "ListingId"
    }
    
    let id: Int
    let Title: String
    let PictureHref: String?
    let Region: String
    let HasBuyNow: Bool?
    let BuyNowPrice: Double?
    let PriceDisplay: String
    let IsClassified: Bool?
}

struct ListingResponse: Decodable {
    let List: [Listing]
}
