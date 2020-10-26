//
//  CyberMarketTests.swift
//  CyberMarketTests
//
//  Created by Jad Messadi on 10/21/20.
//
import XCTest
import Foundation

@testable import CyberMarket
    

class CyberMarketTests: XCTestCase {
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAPIBaseURLStringIsCorrect() {
        
        let baseURL:String = {
            return Environment.APIBasePath()
        }()
        let expectedBaseURLString = "https://raw.githubusercontent.com/leboncoin/paperclip/master/"
         XCTAssertEqual(baseURL, expectedBaseURLString, "Base URL does not match expected base URL.")
     }

    func testShouldGetSuccessResponseForItem() {
        let viewModel = ListViewModel()
        let expect = expectation(description: "Expectation")

        viewModel.getItemList { success in
            XCTAssertTrue(success)
            expect.fulfill()

        }
        waitForExpectations(timeout: 10) { error in
              if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
              }
        }
        
    }

    func testShouldGetSuccessResponseForCategory()  {
        let viewModel = ListViewModel()
        let expect = expectation(description: "Expectation")

        viewModel.getCategory { success in
            XCTAssertTrue(success)
            expect.fulfill()

        }

        waitForExpectations(timeout: 10) { error in
              if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
              }
        }
        
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

