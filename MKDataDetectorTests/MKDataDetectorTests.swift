//
//  MKDataDetectorTests.swift
//  MKDataDetectorTests
//
//  Created by Mayank Kumar on 7/15/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

import XCTest
@testable import MKDataDetector // Internal functions can be independently tested

class MKDataDetectorTests: XCTestCase {
    
    let dataDetectorService = MKDataDetectorService()
    
    func testDateExtraction() {
        let textBody = "I have a program at 7pm this Sunday, which ends on 11am Monday"
        let results = dataDetectorService.extractDates(fromTextBody: textBody)
        XCTAssert(results != nil, "Result must not be nil.")
        XCTAssert(results!.count == 2, "2 results must be returned.")
    }
    
    func testMultipleDateExtractions() {
        let textBodies = ["Program", "Event at 9pm tomorrow", "11am party"]
        let results = dataDetectorService.extractDates(fromTextBodies: textBodies)
        XCTAssert(results != nil, "Result must not be nil.")
        XCTAssert(results!.count == 2, "2 results must be returned.")
    }
    
    func testLinkExtraction() {
        let textBody = "My LinkedIn profile is https://www.linkedin.com/in/mayank-kumar-478245b1/, but my Github is at www.github.com/mayankk2308"
        let results = dataDetectorService.extractLinks(fromTextBody: textBody)
        XCTAssert(results != nil, "Result must not be nil.")
        XCTAssert(results!.count == 2, "2 results expected.")
    }
    
    func testMultipleLinkExtractions() {
        let textBodies = ["My LinkedIn profile is https://www.linkedin.com/in/mayank-kumar-478245b1/", "My Github is at www.github.com/mayankk2308", "This has no links!"]
        let results = dataDetectorService.extractLinks(fromTextBodies: textBodies)
        XCTAssert(results != nil, "Result must not be nil.")
        XCTAssert(results!.count == 2, "2 results expected.")
    }
}
