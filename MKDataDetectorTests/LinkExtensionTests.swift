//
//  LinkExtensionTests.swift
//  MKDataDetector
//
//  Created by Jeet Parte on 22/07/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import XCTest
@testable import MKDataDetector

class LinkTests: XCTestCase {

    let dataDetectorService = MKDataDetectorService()
    var textBody = "My LinkedIn profile is https://www.linkedin.com/in/mayank-kumar-478245b1/, but my Github is at www.github.com/mayankk2308"
    var textBodies = ["My LinkedIn profile is https://www.linkedin.com/in/mayank-kumar-478245b1/", "My Github is at www.github.com/mayankk2308", "This has no links!"]
    let type: NSTextCheckingResult.CheckingType = .link
    var nsDataDetector: NSDataDetector!
    
    override func setUp() {
        super.setUp()
        nsDataDetector = try! NSDataDetector(types: type.rawValue)
        
        //Change textbodies if required
//        textBody = ""
//        textBodies = []
    }
    
    func testSingleTextBody() {
        let results = dataDetectorService.extractLinks(fromTextBody: textBody)
        let expectedCount = nsDataDetector.numberOfMatches(in: textBody, range: NSMakeRange(0, textBody.utf16.count))
        if expectedCount > 0 {
            XCTAssertNotNil(results)
            XCTAssertEqual(results!.count, expectedCount)
        } else {
            XCTAssertNil(results)
        }
    }
    
    func testMultipleTextBodies() {
        let combinedResults = dataDetectorService.extractLinks(fromTextBodies: textBodies)
        
        //Check no.of matches for all textbodies
        let mergedTextBody = concatenate(textBodies)
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
