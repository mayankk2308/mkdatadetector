//
//  Date.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/9/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

import Foundation

extension MKDataDetectorService {
    
    public func extractDates(withTextBody textBody: String) -> [DateAnalysisResult?]? {
        return extractData(withTextBody: textBody)
    }
    
    public func extractDates(withTextBodies textBodies: [String]) -> [[DateAnalysisResult?]?]? {
        return extractData(withTextBodies: textBodies)
    }
}
