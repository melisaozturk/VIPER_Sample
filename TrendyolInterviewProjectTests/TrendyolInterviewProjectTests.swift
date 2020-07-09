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
    func testGetMoviesWithExpectedURLHostAndPath() {
       let listInteractor = ListInteractor()
        ListInteractor.getFeed(<#T##self: ListInteractor##ListInteractor#>)
        
    }
    func test_Authentication_Positive() {
        
        // given
//        let authenticationExpectation = expectation(description: "Authentication")
//        var authentication = Authentication()
//        let params: [String: AnyObject] = [
//            "userName": "user@abc.com" as AnyObject,
//            "password": "User12345" as AnyObject ]
        
        // when
        
//        ListInteractor.getFeed(from: .widget, completion: { response in
//                  switch response {
//                  case .success(let successResponse):
//                      guard let results = successResponse.self else {return}
//                  case .failure( _):
//                      print("List Fetch Failed")
//                  }
//              })
        
//        Authentication.auth(params: params, success: { (result) in
//            authentication = result
//            authenticationExpectation.fulfill()
//        }, failure: { (error) in
//            print(error)
//        })
//
//        // then
//        waitForExpectations(timeout: 2) { _ in
//            XCTAssertNotNil(authentication)
//            XCTAssertEqual(authentication.name, "Alaattin Bedir")
//        }
        
    }
}
