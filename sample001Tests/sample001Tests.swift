//
//  sample001Tests.swift
//  sample001Tests
//
//  Created by Takatomo Okitsu on 2015/02/12.
//  Copyright (c) 2015年 Takatomo Okitsu. All rights reserved.
//

import UIKit
import XCTest

class sample001Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        self.measureBlock { () -> Void in
            XCTAssert(true, "Pass")
        }
    }
    
    func testRealm() {
//        RealmPerformance.saveUser1million()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
