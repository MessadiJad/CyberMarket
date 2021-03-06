//
//  DetailsItemViewModel.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/22/20.
//

import Foundation

class DetailsItemViewModel {
   
    var thumbImageUrl: String?
    var categoryName : Category
    var title: String
    var price: Float
    var creation_date: Date?
    var description: String
    var isUrgent: Bool
  
    init(item:Item,  categoryName: Category) {
        self.thumbImageUrl = item.largeImage
        self.title = item.title
        self.price = item.price
        self.categoryName = categoryName
        self.description = item.description
        self.isUrgent = item.isUrgent
        if let creationDate = item.creationDate {
        self.creation_date = DateApp.dateLocal(fromString: creationDate, withFormat: .isoFull)
        }
    }
    
}
