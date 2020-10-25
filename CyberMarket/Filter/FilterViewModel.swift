//
//  FilterViewModel.swift
//  CyberMarket
//
//  Created by Jad Messadi on 10/23/20.
//

import Foundation

class FilterViewModel {
    var categorys = [Category]()
    var sortTitle = ["Les plus recents","Les plus anciens","Les plus urgents"]
    var sortId = [12,13,14]

    init(categorys : [Category]) {
        self.categorys = categorys
    }
}
