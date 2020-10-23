//
//  Category.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/22/20.
//
import UIKit
class Category {
    
    var id: Int!
    var name: String!
    var color: UIColor!
    
    init(id: Int, name: String, color: UIColor) {
        self.id = id
        self.name = name
        self.color = color
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
}
