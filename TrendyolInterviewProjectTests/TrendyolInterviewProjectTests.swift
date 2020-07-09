//
//  TrendyolInterviewProjectTests.swift
//  TrendyolInterviewProjectTests
//
//  Created by melisa öztürk on 6.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import XCTest
@testable import TrendyolInterviewProject

class TrendyolInterviewProjectTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetListService() {
        
        let exp = expectation(description: "Check list call is")
        let result = XCTWaiter.wait(for: [exp], timeout: 3)
        
        if result == XCTWaiter.Result.timedOut {
            let service = ListInteractor()
            service.getFeed(from: .widget, completion: { response in
                switch response {
                case .success(_):
                    XCTAssertTrue(true, "assert is true")
                    sleep(5)
                    exp.fulfill()
                case .failure( _):
                    XCTAssertFalse(false, "assert is false")
                }
            })
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
}
