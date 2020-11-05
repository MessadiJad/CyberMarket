//
//  FilterViewModel.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/23/20.
//

import UIKit

protocol FilterViewControllerDelegate:class {
    func filterd(_ controller: FilterViewController, category_id: Int?,sort_id:Int?, active: Bool)
}

class FilterViewModel {
    weak var delegate: FilterViewControllerDelegate?
    var currentIndexPath : IndexPath?
    var items = [Item]()
    var categorys = [Category]()
    var sortTitle = [NSLocalizedString("SORT_NEWEST_DATE_BUTTON", comment: ""),
                     NSLocalizedString("SORT_OLDER_DATE_BUTTON", comment: ""),
                     NSLocalizedString("SORT_IMPORTANT_BUTTON", comment: "")]
    var sortId = [12,13,14]
    var category_id : Int?
    var sort_id : Int?
    
    init() {}
    
    init(items: [Item], categorys : [Category]) {
        self.items = items
        self.categorys = categorys
    }
    
    func filter (controller: FilterViewController, category_id:Int?, sort_id: Int?, active: Bool) {
        delegate?.filterd(controller, category_id: category_id, sort_id: sort_id, active: active)
    }
    
    func resetFilter() {
        UserDefaults.standard.removeObject(forKey: "category_id")
        UserDefaults.standard.removeObject(forKey: "sort_id")
    }
    
    func getCategory() -> Int {
        return UserDefaults.standard.integer(forKey: "category_id")
    }
    
    func getSortId() -> Int {
        return UserDefaults.standard.integer(forKey: "sort_id")
    }
    
    func saveCategory(id: Int?) {
        UserDefaults.standard.set(id, forKey: "category_id")
    }
    
    func saveSortId(id: Int?) {
        UserDefaults.standard.set(id, forKey: "sort_id")
    }
    
    func removeSortId() {
        sort_id = nil
        UserDefaults.standard.removeObject(forKey: "sort_id")
    }
    
    func removeCategoryId() {
        category_id = nil
        UserDefaults.standard.removeObject(forKey: "category_id")
    }
}
