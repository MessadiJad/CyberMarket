//
//  Item.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/21/20.
//

class Item {
    
    var id: Int!
    var category_id: Int!
    var title: String!
    var description: String!
    var price: Float!
    var images_url : String!
    var creation_date: String!
    var is_urgent: Bool!
    
    init(category_id: Int, title: String, description: String, price: Float, images_url: String, creation_date: String, is_urgent:Bool) {
        self.category_id = category_id
        self.title = title
        self.description = description
        self.price = price
        self.images_url = images_url
        self.creation_date = creation_date
        self.is_urgent = is_urgent
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case category_id
        case title
        case description
        case price
        case creation_date
        case is_urgent
    }
    
}
