//
//  TestFilterViewModel.swift
//  CyberMarketTests
//
//  Created by Jad Messadi on 10/26/20.
//

import XCTest
@testable import CyberMarket

class FilterViewModelTests: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func TestExistanceItemsAndCategorys() {
        //TODO
    }
    
    func testGetSavedCategoryId() {
        let viewModel = FilterViewModel()
        viewModel.saveCategory(id: 1)
        let savedId = viewModel.getCategory()
        
        XCTAssertEqual(savedId, 1)
    }

    
    func testGetSavedSortedId() {
        let viewModel = FilterViewModel()
        viewModel.saveSortId(id: 2)
        let savedId = viewModel.getSortId()
        
        XCTAssertEqual(savedId, 2)
    }
    
    func testResetFilter() {
        let viewModel = FilterViewModel()
        viewModel.saveSortId(id: 2)
        viewModel.saveCategory(id: 1)

        viewModel.resetFilter()
        let savedCategoryId = viewModel.getCategory()
        let savedSortId = viewModel.getSortId()

        XCTAssertEqual(savedCategoryId, Int())
        XCTAssertEqual(savedSortId, Int())
        
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
