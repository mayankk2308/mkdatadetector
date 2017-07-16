//
//  Date.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/9/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation

extension MKDataDetectorService {
    
    public func extractDates(fromTextBody textBody: String) -> [DateAnalysisResult]? {
        return extractData(fromTextBody: textBody, withResultType: .date)
    }
    
    public func extractDates(fromTextBodies textBodies: [String]) -> [[DateAnalysisResult]?]? {
        return extractData(fromTextBodies: textBodies, withResultType: .date)
    }
    
}
