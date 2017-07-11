//
//  MKDataDetectorService.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/8/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

import Foundation

public class MKDataDetectorService {
    
    internal let checkingTypeMap = [
        ResultType.date: NSTextCheckingResult.CheckingType.date.rawValue,
        ResultType.address: NSTextCheckingResult.CheckingType.address.rawValue,
        ResultType.link: NSTextCheckingResult.CheckingType.link.rawValue,
        ResultType.phoneNumber: NSTextCheckingResult.CheckingType.phoneNumber.rawValue,
        ResultType.transitInformation: NSTextCheckingResult.CheckingType.transitInformation.rawValue,
    ]
    
    public init() {}
    
    internal func extractData<T>(fromTextBody textBody: String, withResultType type: ResultType) -> [AnalysisResult<T>?]? {
        guard let detector = dataDetectorOfType(withResultType: type) else { return nil }
        return extractData(fromTextBody: textBody, withDetector: detector, withResultType: type)
    }
    
    internal func extractData<T>(fromTextBodies textBodies: [String], withResultType type: ResultType) -> [[AnalysisResult<T>?]?]? {
        guard let detector = dataDetectorOfType(withResultType: type) else { return nil }
        var result = [[AnalysisResult<T>?]?]()
        for textBody in textBodies {
            if let extractedData: [AnalysisResult<T>?] = extractData(fromTextBody: textBody, withDetector: detector, withResultType: type) {
                result.append(extractedData)
            }
        }
        return result.isEmpty ? nil : result
    }
    
    internal func extractData<T>(fromTextBody textBody: String, withDetector detector: NSDataDetector, withResultType type: ResultType) -> [AnalysisResult<T>?]? {
        var analysisResults = [AnalysisResult<T>]()
        let matches = detector.matches(in: textBody, range: NSRange(location: 0, length: (textBody as NSString).length))
        if matches.isEmpty {
            return nil
        }
        else {
            for match in matches {
                var analysisResult = AnalysisResult<T>()
                analysisResult.source = extractSource(fromTextBody: textBody, usingRange: match.range)
                analysisResult.data = retrieveData(fromMatch: match, withResultType: type)
                analysisResults.append(analysisResult)
            }
        }
        return analysisResults.isEmpty ? nil : analysisResults
    }
}
