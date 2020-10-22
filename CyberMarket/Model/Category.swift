//
//  Category.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/22/20.
//

class Category {
    
    var id: Int!
    var name: String!
  
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
   
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name

    }
    
}
