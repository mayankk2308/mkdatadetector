//
//  TransitInformation.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/9/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation

extension MKDataDetectorService {
    
    public func extractTransitInformation(fromTextBody textBody: String) -> [TransitAnalysisResult]? {
        return extractData(fromTextBody: textBody, withResultTypes: [.transitInformation])
    }
    
    public func extractTransitInformation(fromTextBodies textBodies: [String]) -> [[TransitAnalysisResult]]? {
        return extractData(fromTextBodies: textBodies, withResultTypes: [.transitInformation])
    }
    
}
