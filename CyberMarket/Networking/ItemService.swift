//
//  ItemService.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/21/20.
//

import Foundation
import UIKit

enum ItemServiceError: Error {
    case UnexpectedAPIResponse
}

enum ItemListResponse {
    case Success(item: [Item])
    case Failure(error: Error)
}

enum CategoryListResponse {
    case Success(category: [Category])
    case Failure(error: Error)
}


class ItemService {
    
    static let sharedService = ItemService()
    
    func getItemsWithCompletion(completion: @escaping ((ItemListResponse) -> Void)) {
        
        let request = URLRequest(url: Environment.urlType(type: .items))
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            var result: ItemListResponse
            
            if let error = error {
                result = ItemListResponse.Failure(error: error)
            } else if let data = data {
                
                do {
                    var returnedItem = [Item]()
                    
                    if let itemEntries =  try JSONSerialization.jsonObject(with: data, options: []) as? NSArray  {
                        
                        for entry in itemEntries {
                            
                            let itemEntry = entry as? NSDictionary
                            
                            guard let category_id = itemEntry?["category_id"] as? Int else { continue }
                            
                            guard let title = itemEntry?["title"] as? String else { continue }
                            
                            guard let description = itemEntry?["description"] as? String else { continue }
                            
                            guard let price = itemEntry?["price"] as? Float else { continue }
                            
                            let imageEntry = itemEntry?["images_url"] as? NSDictionary
                            guard let thumb = imageEntry?["thumb"] as? String else { continue }
                            
                            guard let creationDate = itemEntry?["creation_date"] as? String else { continue }
                            
                            guard let urgent = itemEntry?["is_urgent"] as? Bool else { continue }
                            
                            returnedItem.append(Item(category_id: category_id, title: title, description: description, price: price, images_url: thumb, creation_date: creationDate, is_urgent: urgent))
                        }
                    }
                    result = ItemListResponse.Success(item: returnedItem)
                } catch let error as NSError {
                    result = ItemListResponse.Failure(error: error)
                }
            } else {
                result = ItemListResponse.Success(item: [Item]())
            }
            completion(result)
        }
        task.resume()
        
    }
    
    func getCategoryWithCompletion(completion: @escaping ((CategoryListResponse) -> Void)) {
        
        let request = URLRequest(url: Environment.urlType(type: .category))
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            var result: CategoryListResponse
            
            if let error = error {
                result = CategoryListResponse.Failure(error: error)
            } else if let data = data {
                
                do {
                    var returnedCategory = [Category]()
                    
                    if let categoryEntries =  try JSONSerialization.jsonObject(with: data, options: []) as? NSArray  {
                        
                        for entry in categoryEntries {
                            
                            let categoryEntry = entry as? NSDictionary
                            
                            guard let category_id = categoryEntry?["id"] as? Int else { continue }
                            
                            guard let category_name = categoryEntry?["name"] as? String else { continue }
                            
                            returnedCategory.append(Category(id: category_id, name: category_name, color: UIColor()))
                        }
                    }
                    result = CategoryListResponse.Success(category: returnedCategory)
                } catch let error as NSError {
                    result = CategoryListResponse.Failure(error: error)
                }
            } else {
                result = CategoryListResponse.Success(category: [Category]())
            }
            completion(result)
        }
        task.resume()
        
    }

}