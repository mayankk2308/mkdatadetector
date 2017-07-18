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
        ResultType.date: NSTextCheckingResult.CheckingType.date,
        ResultType.address: NSTextCheckingResult.CheckingType.address,
        ResultType.link: NSTextCheckingResult.CheckingType.link,
        ResultType.phoneNumber: NSTextCheckingResult.CheckingType.phoneNumber,
        ResultType.transitInformation: NSTextCheckingResult.CheckingType.transitInformation
    ]
    
    internal let inverseCheckingTypeMap: [NSTextCheckingResult.CheckingType.RawValue : ResultType] = [
        NSTextCheckingResult.CheckingType.date.rawValue: ResultType.date,
        NSTextCheckingResult.CheckingType.address.rawValue: ResultType.address,
        NSTextCheckingResult.CheckingType.link.rawValue: ResultType.link,
        NSTextCheckingResult.CheckingType.phoneNumber.rawValue: ResultType.phoneNumber,
        NSTextCheckingResult.CheckingType.transitInformation.rawValue: ResultType.transitInformation
    ]
    
    public init() {}
    
    internal func extractData<T>(fromTextBody textBody: String, withDetector detector: NSDataDetector? = nil, withResultTypes types: [ResultType]) -> [AnalysisResult<T>]? {
        var analysisResults = [AnalysisResult<T>]()
        let dataDetector: NSDataDetector
        if detector != nil {
            dataDetector = detector!
        } else {
            guard let detector = dataDetectorOfType(withResultTypes: types) else { return nil }
            dataDetector = detector
        }
        let matches = dataDetector.matches(in: textBody, range: NSRange(location: 0, length: (textBody as NSString).length))
        if matches.isEmpty {
            return nil
        } else {
            for match in matches {
                let range = match.range
                let source = textBody
                let dataString = extractSource(fromTextBody: textBody, usingRange: range)
                guard let data: T = retrieveData(fromMatch: match, withMatchType: match.resultType) else { continue }
                guard let resultType = inverseCheckingTypeMap[match.resultType.rawValue] else { continue }
                let analysisResult = AnalysisResult<T>(source: source, rangeInSource: range, dataString: dataString, dataType: resultType, data: data)
                analysisResults.append(analysisResult)
            }
        }
        return analysisResults.isEmpty ? nil : analysisResults
    }
    
    internal func extractData<T>(fromTextBodies textBodies: [String], withResultTypes types: [ResultType]) -> [[AnalysisResult<T>]]? {
        var result = [[AnalysisResult<T>]]()
        guard let detector = dataDetectorOfType(withResultTypes: types) else { return nil }
        for textBody in textBodies {
            guard let extractedData: [AnalysisResult<T>] = extractData(fromTextBody: textBody, withDetector: detector, withResultTypes: types) else { continue }
                result.append(extractedData)
        }
        return result.isEmpty ? nil : result
    }
}
