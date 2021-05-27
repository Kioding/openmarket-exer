//
//  Itema.swift
//  OpenMarket
//
//  Created by kio on 2021/05/27.
//

import Foundation

struct ItemModification {
    let title: String?
    let descriptions: String?
    let price: Int?
    let currency: String?
    let stock: Int?
    let discountedPrice: Int?
    let images: [String]?
    let password: String
    
    private enum CodingKeys: String, CodingKey {
        case title, descriptions, price, currency, stock, images, password
        case discountedPrice = "discounted_price"
    }
}
