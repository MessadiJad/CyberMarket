//
//  ListViewModel.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/21/20.
//

import UIKit

class ListViewModel: FilterViewControllerDelegate {

    var items = [Item]()
    var categorys = [Category]()
    var filteredItems = [Item]()

    typealias CompletionHandler = (_ success:Bool) -> Void
    var competion: Bool = false
    
    func getItemList(completionHandler: @escaping CompletionHandler) {
        ItemService.sharedService.getItemsWithCompletion { [self] response in
            switch response {
            case .Failure(let error):
                print("Error fetching items: \(error)")
            case .Success(let returnedItem):
                self.items = returnedItem
                self.filteredItems = self.items
                UserDefaults.standard.removeObject(forKey: "category_id")
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
    
    func filterd(_ controller: FilterViewController, category_id: Int?, active: Bool) {
        if (active){
            let filtered = self.items.filter { $0.category_id == category_id }
            self.filteredItems = filtered
        } else {self.filteredItems = items }
       
    }
}
