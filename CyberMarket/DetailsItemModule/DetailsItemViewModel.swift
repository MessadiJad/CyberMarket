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
        self.thumbImageUrl = item.images_url
        self.title = item.title
        self.price = item.price
        self.categoryName = categoryName
        self.creation_date = DateApp.dateLocal(fromString: (item.creation_date)!, withFormat: .isoFull)
        self.description = item.description
        self.isUrgent = item.is_urgent
    }
    
}