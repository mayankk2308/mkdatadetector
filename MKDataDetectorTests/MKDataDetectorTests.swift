//
//  MKDataDetectorTests.swift
//  MKDataDetectorTests
//
//  Created by Mayank Kumar on 7/15/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

import XCTest
import MKDataDetector

class MKDataDetectorTests: XCTestCase {
    
    let dataDetectorService = MKDataDetectorService()
    
    func testDateExtraction() {
        let textBody = "I have a program at 7pm this Sunday, which ends on 11am Monday"
        let results = dataDetectorService.extractDates(fromTextBody: textBody)
        XCTAssert(results != nil, "Result must not be nil.")
        XCTAssert(results!.count == 2, "2 results must be returned.")
    }
}
