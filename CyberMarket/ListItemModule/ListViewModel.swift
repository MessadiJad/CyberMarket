//
//  ListViewModel.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/21/20.
//

import UIKit

protocol BadgeShownDelegate:class {
    func showBadge(number:Int)
    func hideBadge()
}

class ListViewModel: FilterViewControllerDelegate {
    
    var categorys = [Category]()
    var allItems = [Item]()
    var initialList = [Item]()
    weak var delegate: BadgeShownDelegate?
    typealias CompletionHandler = (_ success:Bool) -> Void
    
    func getItemList(completionHandler: @escaping CompletionHandler) {
        removeAllKeys()
        Service.sharedService.getItemsWithCompletion { [self] response in
            switch response {
            case .results(let results) :
                self.initialList = results
                self.allItems = results
                completionHandler(true)
            case .error(_):
            completionHandler(false)
            }
        }
    }
    
    func getCategory(completionHandler: @escaping CompletionHandler){
        Service.sharedService.getCategoryWithCompletion { response in
            switch response {
            case .results(let results):
                self.categorys = results
                completionHandler(true)
            case .error(_):
                completionHandler(false)
            }
        }
    }
    
    func filterd(_ controller: FilterViewController, category_id: Int?, sort_id: Int?, active: Bool) {
        if (active){
            self.allItems = initialList
            if sort_id == nil {
                let filteredItems = allItems.filter { $0.categoryId == category_id }
                self.allItems = filteredItems
            }else {
                switch sort_id {
                case 12 :
                    self.allItems.sort {
                        $0.creationDate > $1.creationDate
                    }
                case 13 :
                    self.allItems.sort {
                        $0.creationDate < $1.creationDate
                    }
                case 14:
                    let filteredItems = allItems.filter { $0.isUrgent == true }
                    self.allItems = filteredItems
                default:
                    break
                }
            }
            delegate?.showBadge(number: 1)
        } else {self.allItems = initialList
            delegate?.hideBadge()
        }
    }
    
    func removeAllKeys() {
        UserDefaults.standard.removeObject(forKey: "category_id")
        UserDefaults.standard.removeObject(forKey: "sort_id")
    }
}
