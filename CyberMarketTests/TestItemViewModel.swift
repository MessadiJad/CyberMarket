//
//  TestItemViewModel.swift
//  CyberMarketTests
//
//  Created by Jad Messadi on 10/26/20.
//

import XCTest
@testable import CyberMarket

class TestItemViewModel: XCTestCase {
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetItems() {
        let viewModel = ListViewModel()
        
        viewModel.getItemList(completionHandler: { success in
            if success {
                XCTAssertTrue(viewModel.items.count > 0)
            }
        })
    }
    
    func testGetCategory() {
        let viewModel = ListViewModel()
        let categorys: () = viewModel.getCategory { _ in
        }
        XCTAssertNotNil(categorys)

    }
    
    func testItem() {
        let item = createSingleItem(title: "test", catId: 1)
        XCTAssertEqual(item.category_id, 1)
        XCTAssertEqual(item.title, "test")
    }
    
    func testFilterdItem() {
        let viewModel = ListViewModel()
        let filterViewModel = FilterViewModel()
        let items = createItemsArray(categoriesIds: 10, title: "titleStr", count: 10)
        viewModel.filterd(FilterViewController(filterViewModel), items: items, category_id: 1, sort_id: nil, active: true)
        
        XCTAssertTrue(viewModel.filteredItems.count > 0)
        
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func createSingleItem(title:String, catId: Int) -> Item {
        let item = Item(category_id: catId, title: title, description: "desc", price: 100, images_url: "", creation_date: "", is_urgent: true)
        return item
    }
    
    func createItemsArray(categoriesIds:Int,title:String,count:Int) -> [Item] {
        var items = [Item]()
        for  i in 0...count {
            items.append(createSingleItem(title: title, catId: i%categoriesIds))
        }
        return items
    }
    
}
