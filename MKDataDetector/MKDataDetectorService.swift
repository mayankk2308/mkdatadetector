//
//  MKDataDetectorService.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/8/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation
import CoreLocation

public class MKDataDetectorService {
    
    internal let checkingTypeMap = [
        ResultType.date: NSTextCheckingResult.CheckingType.date.rawValue,
        ResultType.address: NSTextCheckingResult.CheckingType.address.rawValue,
        ResultType.link: NSTextCheckingResult.CheckingType.link.rawValue,
        ResultType.phoneNumber: NSTextCheckingResult.CheckingType.phoneNumber.rawValue,
        ResultType.transitInformation: NSTextCheckingResult.CheckingType.transitInformation.rawValue,
    ]
    
    public init() {}
    
    internal func extractData<T>(fromTextBody textBody: String, withDetector detector: NSDataDetector? = nil, withResultType type: ResultType) -> [AnalysisResult<T>]? {
        var analysisResults = [AnalysisResult<T>]()
        let dataDetector: NSDataDetector
        if detector != nil {
            dataDetector = detector!
        } else {
            guard let detector = dataDetectorOfType(withResultType: type) else { return nil }
            dataDetector = detector
        }
        let matches = dataDetector.matches(in: textBody, range: NSRange(location: 0, length: (textBody as NSString).length))
        if matches.isEmpty {
            return nil
        } else {
            for match in matches {
                let range = match.range
                let source = textBody
                guard let data: T = retrieveData(fromMatch: match, withResultType: type) else { continue }
                let analysisResult = AnalysisResult<T>(source: source, rangeInSource: range, data: data)
                analysisResults.append(analysisResult)
            }
        }
        return analysisResults.isEmpty ? nil : analysisResults
    }
    
    internal func extractData<T>(fromTextBodies textBodies: [String], withResultType type: ResultType) -> [[AnalysisResult<T>]?]? {
        var result = [[AnalysisResult<T>]?]()
        guard let detector = dataDetectorOfType(withResultType: type) else { return nil }
        for textBody in textBodies {
            if let extractedData: [AnalysisResult<T>] = extractData(fromTextBody: textBody, withDetector: detector, withResultType: type) {
                result.append(extractedData)
            }
        }
        return result.isEmpty ? nil : result
    }
}
