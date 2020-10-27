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

    var items = [Item]()
    var categorys = [Category]()
    var filteredItems = [Item]()
    weak var delegate: BadgeShownDelegate?

    typealias CompletionHandler = (_ success:Bool) -> Void
    var competion: Bool = false
    
    func getItemList(completionHandler: @escaping CompletionHandler) {
        ItemService.sharedService.getItemsWithCompletion { [self] response in
            removeAllKeys()
            switch response {
            case .Failure(_):
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                showErrorAlertView(title: NSLocalizedString("ERROR_TITLE", comment: ""), body: NSLocalizedString("ERROR_BODY_ITEMS", comment: ""))
                }
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
            case .Failure(_):
                DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                showErrorAlertView(title: NSLocalizedString("ERROR_TITLE", comment: ""), body: NSLocalizedString("ERROR_TITLE_CATEGORY", comment: ""))
                }
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
            delegate?.showBadge(number: 1)
        } else {self.filteredItems = items
            delegate?.hideBadge()
        }
       
    }
    
    func removeAllKeys() {
        UserDefaults.standard.removeObject(forKey: "category_id")
        UserDefaults.standard.removeObject(forKey: "sort_id")
    }
}
