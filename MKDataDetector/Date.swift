//
//  Date.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/9/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

import Foundation

extension MKDataDetectorService {
    
    public func extractDates(withTextBody textBody: String) -> [AnalysisResult<Date>?]? {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.date.rawValue)
            return extractDates(withTextBody: textBody, withDetector: detector)
        }
        catch {
            return nil
        }
    }
    
    public func extractDates(withTextBodies textBodies: [String]) -> [[AnalysisResult<Date>?]?]? {
        var result = [[AnalysisResult<Date>?]?]()
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.date.rawValue)
            for textBody in textBodies {
                if let extract = extractDates(withTextBody: textBody, withDetector: detector) {
                    result.append(extract)
                }
                else {
                    result.append(nil)
                }
            }
            return result.isEmpty ? nil : result
        }
        catch {
            return nil
        }
    }
    
    private func extractDates(withTextBody textBody: String, withDetector detector: NSDataDetector) -> [AnalysisResult<Date>?]? {
        var analysisResults = [AnalysisResult<Date>]()
        let matches = detector.matches(in: textBody, range: NSRange(location: 0, length: (textBody as NSString).length))
        if matches.isEmpty {
            return nil
        }
        else {
            for match in matches {
                var analysisResult = AnalysisResult<Date>()
                analysisResult.source = extractSource(fromTextBody: textBody, usingRange: match.range)
                analysisResult.data = match.date
                analysisResults.append(analysisResult)
            }
        }
        return analysisResults.isEmpty ? nil : analysisResults
    }
    
}
