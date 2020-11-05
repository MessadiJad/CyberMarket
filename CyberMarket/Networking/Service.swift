//
//  ItemService.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/21/20.
//

import Foundation

class Service {
    
    static let sharedService = Service()
    
    func getItemsWithCompletion(completion: @escaping ((Item.ItemsResponse) -> Void)) {
        guard let url = Environment.urlType(.items) else {return}
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
               guard error == nil else { return }
               guard let data = data else { return }
               do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                var results = try decoder.decode(Array<Item>.self, from: data)
                results.sort { $0.creationDate > $1.creationDate }
                completion(Item.ItemsResponse.results(results))
               } catch { completion(Item.ItemsResponse.error(error)) }
           })
        task.resume()
    }
    
    func getCategoryWithCompletion(completion: @escaping ((Category.CategoryResponse) -> Void)) {
        guard let url = Environment.urlType(.category) else {return}
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
               guard error == nil else { return }
               guard let data = data else { return }
               do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try decoder.decode(Array<Category>.self, from: data)
                completion(Category.CategoryResponse.results(results))
               } catch { completion(Category.CategoryResponse.error(error)) }
           })
        task.resume()
    }

}
