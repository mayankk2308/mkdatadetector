//
//  StringAccessTests.swift
//  MKDataDetector
//
//  Created by Jeet Parte on 23/07/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import XCTest
@testable import MKDataDetector

class StringAccessTests: XCTestCase {
    
    var testString = "This test was written at 1:34 PM"
    var type: NSTextCheckingResult.CheckingType!
    var nsDataDetector: NSDataDetector!
    
    override func setUp() {
        super.setUp()
        
        //Change test string here
//        testString = "+14138016324"
//        testString = ""
    }

    func testDates() {
        let dates = testString.dates
        type = .date
        nsDataDetector = try! NSDataDetector(types: type.rawValue)
        let expectedCount = nsDataDetector.numberOfMatches(in: testString, range: NSMakeRange(0, testString.utf16.count))
        if expectedCount > 0 {
            XCTAssertNotNil(dates)
            XCTAssertEqual(dates!.count, expectedCount)
        } else {
            XCTAssertNil(dates)
        }
    }
    
    func testLinks() {
        let links = testString.links
        type = .link
        nsDataDetector = try! NSDataDetector(types: type.rawValue)
        let expectedCount = nsDataDetector.numberOfMatches(in: testString, range: NSMakeRange(0, testString.utf16.count))
        if expectedCount > 0 {
            XCTAssertNotNil(links)
            XCTAssertEqual(links!.count, expectedCount)
        } else {
            XCTAssertNil(links)
        }
    }
    
    func testAddresses() {
        let addresses = testString.addresses
        type = .address
        nsDataDetector = try! NSDataDetector(types: type.rawValue)
        let expectedCount = nsDataDetector.numberOfMatches(in: testString, range: NSMakeRange(0, testString.utf16.count))
        if expectedCount > 0 {
            XCTAssertNotNil(addresses)
            XCTAssertEqual(addresses!.count, expectedCount)
        } else {
            XCTAssertNil(addresses)
        }
    }
    
    func testPhoneNumbers() {
        let phoneNumbers = testString.phoneNumbers
        type = .phoneNumber
        nsDataDetector = try! NSDataDetector(types: type.rawValue)
        let expectedCount = nsDataDetector.numberOfMatches(in: testString, range: NSMakeRange(0, testString.utf16.count))
        if expectedCount > 0 {
            XCTAssertNotNil(phoneNumbers)
            XCTAssertEqual(phoneNumbers!.count, expectedCount)
        } else {
            XCTAssertNil(phoneNumbers)
        }
    }
    
    func testTransitInfo() {
        let transitInfo = testString.transitInfo
        type = .transitInformation
        nsDataDetector = try! NSDataDetector(types: type.rawValue)
        let expectedCount = nsDataDetector.numberOfMatches(in: testString, range: NSMakeRange(0, testString.utf16.count))
        if expectedCount > 0 {
            XCTAssertNotNil(transitInfo)
            XCTAssertEqual(transitInfo!.count, expectedCount)
        } else {
            XCTAssertNil(transitInfo)
        }
    }
}
