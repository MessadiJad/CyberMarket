//
//  Category.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/22/20.
//


class Category: Codable {
    
    var id: Int!
    var name: String!
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)        
    }
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    enum CodingKeys: String, CodingKey   {
        case id
        case name
    }
    
    enum CategoryResponse {
        case results([Category])
        case error(Error)
    }
    
}
