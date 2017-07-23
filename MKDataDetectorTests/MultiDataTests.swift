//
//  MultiDataTests.swift
//  MKDataDetector
//
//  Created by Jeet Parte on 23/07/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

import XCTest
@testable import MKDataDetector

class MultiDataTests: XCTestCase {

    let dataDetectorService = MKDataDetectorService()
    var mixedtextBody = "Call me on +1123456789 on 2017/13/12 at 5pm when you reach 990 Belchertown Rd, Amherst, MA - 01440 USA. Checkout out my website www.example.com. I'm flying to Paris tomorrow by Flight 2223"
    var mixedTextBodies = ["Call me on +1123456789", "on 2017/13/12 at 5pm", "when you reach 990 Belchertown Rd, Amherst, MA - 01440 USA", "Checkout out my website www.example.com", "I'm flying to Paris tomorrow by Flight 2223"]
    var types: NSTextCheckingResult.CheckingType!
    var nsDataDetector: NSDataDetector!
    
    override func setUp() {
        super.setUp()
        types = [.date, .address, .link, .phoneNumber, .transitInformation]
        nsDataDetector = try! NSDataDetector(types: types.rawValue)
        
        //Change textbodies here
//        mixedtextBody = ""
//        mixedTextBodies = []
    }
    func testSingleTextBody() {
        let results = dataDetectorService.extractInformation(fromTextBody: mixedtextBody, withResultTypes: .date, .address, .link, .phoneNumber, .transitInformation)
        let expectedCount = nsDataDetector.numberOfMatches(in: mixedtextBody, range: NSMakeRange(0, mixedtextBody.utf16.count))
        if expectedCount > 0 {
            XCTAssertNotNil(results)
            XCTAssertEqual(results!.count, expectedCount)
        } else {
            XCTAssertNil(results)
        }
    }
    
    func testMultipleTextBodies() {
        let combinedResults = dataDetectorService.extractInformation(fromTextBodies: mixedTextBodies, withResultTypes: .date, .address, .link, .phoneNumber, .transitInformation)
        
        //Check no.of matches for all textbodies
        let mergedTextBody = concatenate(mixedTextBodies)
        let totalMatches = nsDataDetector.numberOfMatches(in: mergedTextBody, range: NSMakeRange(0, mergedTextBody.utf16.count))
        if totalMatches > 0 {
            XCTAssertNotNil(combinedResults)
            for individualResult in combinedResults! {
                XCTAssertFalse(individualResult.isEmpty)

                //Check no. of matches for a present textbody
                let source = individualResult.first!.source //grab the textbody
                let expectedCount = nsDataDetector.numberOfMatches(in: source, range: NSMakeRange(0, source.utf16.count))
                XCTAssertEqual(individualResult.count, expectedCount)
            }
        } else {
            XCTAssertNil(combinedResults)
        }
    }
}
