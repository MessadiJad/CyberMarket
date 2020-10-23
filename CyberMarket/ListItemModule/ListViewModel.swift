//
//  ListViewModel.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/21/20.
//

import UIKit

class ListViewModel {
    
    var items = [Item]()
    var categorys = [Category]()

    typealias CompletionHandler = (_ success:Bool) -> Void
    var competion: Bool = false
    
    func getItemList(completionHandler: @escaping CompletionHandler) {
        ItemService.sharedService.getItemsWithCompletion { [self] response in
            switch response {
            case .Failure(let error):
                print("Error fetching items: \(error)")
            case .Success(let returnedItem):
                self.getCategory()
                self.items = returnedItem
                completionHandler(true)
            }
        }
    }
    
    func getCategory() {
        ItemService.sharedService.getCategoryWithCompletion { response in
            switch response {
            case .Failure(let error):
                print("Error fetching category: \(error)")
            case .Success(let returnedCategory):
            self.categorys = returnedCategory
            }
        }
    }
}
