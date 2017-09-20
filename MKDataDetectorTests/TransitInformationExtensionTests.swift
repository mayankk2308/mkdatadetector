//
//  TransitInformationExtensionTests.swift
//  MKDataDetector
//
//  Created by Jeet Parte on 23/07/17.
//  Copyright 2017 Mayank Kumar. Available under the MIT license.
//

import XCTest
@testable import MKDataDetector

class TransitInformationTests: XCTestCase {
    
    let dataDetectorService = MKDataDetectorService()
    var textBody = "UA 2392"
    var textBodies = ["Flight 2334", "EK 239 to Boston", "Emirates Airlines", "United Flight 2223"]
    let type: NSTextCheckingResult.CheckingType = .transitInformation
    var nsDataDetector: NSDataDetector!
    
    override func setUp() {
        super.setUp()
        nsDataDetector = try! NSDataDetector(types: type.rawValue)
        
        //Change textbodies if required
//        textBody = ""
//        textBodies = []
    }
    
    func testSingleTextBody() {
//        let results = dataDetectorService.extractTransitInformation(fromTextBody: textBody)
        let expectedCount = nsDataDetector.numberOfMatches(in: textBody, range: NSMakeRange(0, textBody.utf16.count))
        if expectedCount > 0 {
//            XCTAssertNotNil(results)
//            XCTAssertEqual(results!.count, expectedCount)
        } else {
//            XCTAssertNil(results)
        }
    }
    
//    func testMultipleTextBodies() {
//        let combinedResults = dataDetectorService.extractTransitInformation(fromTextBodies: textBodies)
//
//        //Check no.of matches for all textbodies
//        let mergedTextBody = concatenate(textBodies)
//        let totalMatches = nsDataDetector.numberOfMatches(in: mergedTextBody, range: NSMakeRange(0, mergedTextBody.utf16.count))
//        if totalMatches > 0 {
//            XCTAssertNotNil(combinedResults)
//            for individualResult in combinedResults! {
//                XCTAssertFalse(individualResult.isEmpty)
//
//                //Check no. of matches for a present textbody
//                let source = individualResult.first!.source //grab the textbody
//                let expectedCount = nsDataDetector.numberOfMatches(in: source, range: NSMakeRange(0, source.utf16.count))
//                XCTAssertEqual(individualResult.count, expectedCount)
//            }
//        } else {
//            XCTAssertNil(combinedResults)
//        }
//    }
}
