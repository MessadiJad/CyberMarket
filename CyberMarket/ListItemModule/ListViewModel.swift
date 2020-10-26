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
            removeAllKeys()
            switch response {
            case .Failure(let error):
                print("Error fetching items: \(error)")
            case .Success(let returnedItem):
                self.items = returnedItem
                self.filteredItems = self.items
                completionHandler(true)
            }
        }
    }
    
    func getCategory(completionHandler: @escaping CompletionHandler){
        ItemService.sharedService.getCategoryWithCompletion { response in
            switch response {
            case .Failure(let error):
                print("Error fetching category: \(error)")
            case .Success(let returnedCategory):
            self.categorys = returnedCategory
            completionHandler(true)

            }
        }
    }
    
    func filterd(_ controller: FilterViewController,items: [Item], category_id: Int?, sort_id: Int?, active: Bool) {
        if (active){
            if sort_id == nil {
                let filtered = items.filter { $0.category_id == category_id }
                self.filteredItems = filtered
            }else {
                switch sort_id {
                case 12 :
                    self.items.sort {
                        $0.creation_date > $1.creation_date
                     }
                    self.filteredItems = self.items

                case 13 :
                    self.items.sort {
                       $0.creation_date < $1.creation_date
                    }
                    self.filteredItems = self.items

                case 14:
                    let filtered = items.filter { $0.is_urgent == true }
                    self.filteredItems = filtered                    
                default:
                    break
                }
                
              
            }
        } else {self.filteredItems = items }
       
    }
    
    func removeAllKeys() {
        UserDefaults.standard.removeObject(forKey: "category_id")
        UserDefaults.standard.removeObject(forKey: "sort_id")
    }
}
