//
//  MKDataDetectorService.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/8/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

import Foundation

public class MKDataDetectorService {
    
    public init() {}
    
    internal func extractData<T>(withTextBody textBody: String) -> [AnalysisResult<T>?]? {
        guard let detector = dataDetectorOfType(forType: T.self) else { return nil }
        return extractData(withTextBody: textBody, withDetector: detector)
    }
    
    internal func extractData<T>(withTextBodies textBodies: [String]) -> [[AnalysisResult<T>?]?]? {
        guard let detector = dataDetectorOfType(forType: T.self) else { return nil }
        var result = [[AnalysisResult<T>?]?]()
        for textBody in textBodies {
            if let extractedData: [AnalysisResult<T>?] = extractData(withTextBody: textBody, withDetector: detector) {
                result.append(extractedData)
            }
        }
        return result.isEmpty ? nil : result
    }
    
    internal func extractData<T>(withTextBody textBody: String, withDetector detector: NSDataDetector) -> [AnalysisResult<T>?]? {
        var analysisResults = [AnalysisResult<T>]()
        let matches = detector.matches(in: textBody, range: NSRange(location: 0, length: (textBody as NSString).length))
        if matches.isEmpty {
            return nil
        }
        else {
            for match in matches {
                var analysisResult = AnalysisResult<T>()
                analysisResult.source = extractSource(fromTextBody: textBody, usingRange: match.range)
                if T.self == Date.self {
                    analysisResult.data = match.date as? T
                }
                analysisResults.append(analysisResult)
            }
        }
        return analysisResults.isEmpty ? nil : analysisResults
    }
}
