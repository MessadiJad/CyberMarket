//
//  Item.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/21/20.
//

struct Item: Codable {
    
    var id, categoryId: Int!
    var title, description, creationDate: String!
    var imagesUrl :[String:String]?
    var largeImage : String?
    var smallImage: String?
    var price: Float!
    var isUrgent: Bool!
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.categoryId = try container.decodeIfPresent(Int.self, forKey: .categoryId)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.price = try container.decodeIfPresent(Float.self, forKey: .price)
        self.imagesUrl = try container.decodeIfPresent([String: String].self, forKey: .imagesUrl)
        if let urls = self.imagesUrl {
            self.largeImage = urls["thumb"]
            self.smallImage = urls["small"]
        }
        self.creationDate = try container.decodeIfPresent(String.self, forKey: .creationDate)
        self.isUrgent = try container.decodeIfPresent(Bool.self, forKey: .isUrgent)
    }
    
    init(categoryId: Int, title: String, description: String, price: Float,imagesUrl:Dictionary<String, String>, creationDate: String, isUrgent:Bool) {
        self.categoryId = categoryId
        self.title = title
        self.description = description
        self.price = price
        self.imagesUrl = imagesUrl
        self.price = price
        self.creationDate = creationDate
        self.isUrgent = isUrgent
    }

    enum CodingKeys: String, CodingKey   {
        case id
        case categoryId
        case title
        case description
        case imagesUrl
        case price
        case creationDate
        case isUrgent
    }
    
    enum ItemsResponse {
        case results([Item])
        case error(Error)
    }
    
}
