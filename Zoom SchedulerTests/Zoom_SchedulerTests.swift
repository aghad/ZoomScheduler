//
//  Zoom_SchedulerTests.swift
//  Zoom SchedulerTests
//
//  Created by Destiny Hochhalter Ruiz on 2/19/21.
//

import XCTest
@testable import Zoom_Scheduler

class Zoom_SchedulerTests: XCTestCase {

    func testValidURL() {
        let url = createURL(url: "https://www.google.com") //Testing Valid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, true)
    }
    
    func testValidURL1() {
        let url = createURL(url: "https://www.yahoo.com") //Testing second Valid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, true)
    }

    
    func testValidURL2() {
        let url = createURL(url: "https://www.youtube.com") //Testing second Valid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, true)
    }
    
    func testValidURL3() {
        let url = createURL(url: "https://www.thenew.org") //Testing second Valid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, true)
    }
    
    func testValidURL4() {
        let url = createURL(url: "https://www.facebook.com") //Testing second Valid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, true)
    }
    func testValidURL5() {
        let url = createURL(url: "https://www.ge2wgw.com") //Testing Invalid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, true)
        // Must use NSDataDetector to detect incorrect websites if they're true or false
    }
  /*  func testValidURL6() {
        let url = createURL(url: "https://www.234234242.com") //Testing Invalid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, false)
    }
    func testValidURL7() {
        let url = createURL(url: "https://www.2342342.org") //Testing Invalid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, false)
    }
    func testValidURL8() {
        let url = createURL(url: "https://www.facbook.org") //Testing Invalid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, false)
    }
    func testValidURL9() {
        let url = createURL(url: "https://www.goooooooooooogle33423.com") //Testing Invalid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, false)
    }
    func testValidURL10() {
        let url = createURL(url: "https://www.ge2wgw.com") //Testing Invalid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, false)
    }
    
    */
    
}

    
    
/*
    
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

*/
