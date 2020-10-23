//
//  FilterViewModel.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/23/20.
//

import Foundation

class FilterViewModel {
    var categorys = [Category]()
    
    init(categorys : [Category]) {
        self.categorys = categorys
    }
}
