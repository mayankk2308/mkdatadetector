////
////  AddressExtensionTests.swift
////  MKDataDetector
////
////  Created by Jeet Parte on 22/07/17.
////  Copyright 2017 Mayank Kumar. Available under the MIT license.
////
//
//import XCTest
//import CoreLocation
//@testable import MKDataDetector
//
//class AddressTests: XCTestCase {
//
//    let dataDetectorService = MKDataDetectorService()
//    var textBody = "1800 Ellis St,San Francisco, CA 94102, United States"
//    var textBodies = ["1800 Ellis St,San Francisco, CA 94102, United States", "133 Belchertown Rd Amherst MA - 01003 United States"]
//    let type: NSTextCheckingResult.CheckingType = .address
//    var nsDataDetector: NSDataDetector!
//    
//    override func setUp() {
//        super.setUp()
//        nsDataDetector = try! NSDataDetector(types: type.rawValue)
//        
//        //Change textbodies if required
////        textBody = ""
////        textBodies = []
//    }
//
//    func testSingleTextBody() {
//        let results = dataDetectorService.extractAddresses(fromTextBody: textBody)
//        let expectedCount = nsDataDetector.numberOfMatches(in: textBody, range: NSMakeRange(0, textBody.utf16.count))
//        if expectedCount > 0 {
//            XCTAssertNotNil(results)
//            XCTAssertEqual(results!.count, expectedCount)
//        } else {
//            XCTAssertNil(results)
//        }
//    }
//    
//    func testMultipleTextBodies() {
//        let combinedResults = dataDetectorService.extractAddresses(fromTextBodies: textBodies)
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
//    
////    func testLocationExtractionFromAddressCompletionBlock() {
////        //Test whether completion block is being executed
////        var completionBlockExecuted = false
////        let validAddress = "1800 Ellis St, San Francisco, CA 94102, United States"
////        dataDetectorService.extractLocation(fromAddress: validAddress) { (location) in
////            do {
////                completionBlockExecuted = true
////                XCTAssert(completionBlockExecuted)
////            }
////        }
////    }
//    
//    func testLocationExtractionValidAddress() {
//        //Test valid address
//        let validAddress = "1800 Ellis St, San Francisco, CA 94102, United States"
//        dataDetectorService.extractLocation(fromAddress: validAddress) { location in
//            XCTAssertNotNil(location)
//            XCTAssertEqual(location!.coordinate.latitude, 37.7858, accuracy: 0.05)
//            XCTAssertEqual(location!.coordinate.longitude, -122.4065, accuracy: 0.05)
//        }
//    }
//    
//    func testLocationExtractionInvalidAddress() {
//        //Test invalid address
//        let invalidAddress = "No man's land 🌎"
//        dataDetectorService.extractLocation(fromAddress: invalidAddress) { location in
//            XCTAssertNil(location)
//        }
//    }
//    
//    
//    func testLocationExtractionValidAddressResult() {
//        //Test valid address
//        let validAddress = "1800 Ellis St, San Francisco, CA 94102, United States"
//        let results = dataDetectorService.extractAddresses(fromTextBody: validAddress)
//        let result = results!.first
//        dataDetectorService.extractLocation(fromAnalysisResult: (result!)) { location  in
//            XCTAssertNotNil(location)
//            XCTAssertEqual(location!.coordinate.latitude, 37.7858, accuracy: 0.05)
//            XCTAssertEqual(location!.coordinate.longitude, -122.4065, accuracy: 0.05)
//        }
//    }
//    
//    func testLocationExtractionInvalidAddressResult() {
//        //Test invalid address
//        let invalidAddress = "Fake address: 1800 Calvin St, San Francisco, CA 94102, United Kingdom"
//        let results = dataDetectorService.extractAddresses(fromTextBody: invalidAddress)
//        let result = results!.first
//        dataDetectorService.extractLocation(fromAnalysisResult: (result!)) { location in
//            XCTAssertNil(location)
//        }
//    }
//    
//    func testLocationExtractionPlaceMark() {
//        //placemark nil, error nil
//        let location = dataDetectorService.extractLocation(fromPlacemarks: nil, withError: nil)
//        XCTAssertNil(location)
//        
//        //placemark nil, error not nil
//        let error = CLError(_nsError: NSError())
//        let locationII = dataDetectorService.extractLocation(fromPlacemarks: nil, withError: error)
//        XCTAssertNil(locationII)
//        
//        //placemark not nil, error nil
//        let geocoder = CLGeocoder()
//        let validAddress = "1800 Ellis St, San Francisco, CA 94102, United States"
//        geocoder.geocodeAddressString(validAddress) { (placemarks, error) in
//            XCTAssertNil(error)
//            let locationIII = self.dataDetectorService.extractLocation(fromPlacemarks: placemarks, withError: nil)
//            XCTAssertNotNil(locationIII)
//        }
//    }
//}

