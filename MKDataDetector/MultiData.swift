//
//  MultiData.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/17/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

import Foundation

extension MKDataDetectorService {
    
    public func extractInformation(fromTextBody textBody: String, withResultTypes types: ResultType ...) -> [AnalysisResult<AnalysisData>]? {
        return types.isEmpty ? nil : extractData(fromTextBody: textBody, withResultTypes: types)
    }
    
    public func extractInformation(fromTextBodies textBodies: [String], withResultTypes types: ResultType ...) -> [[AnalysisResult<AnalysisData>]]? {
        return types.isEmpty ? nil : extractData(fromTextBodies: textBodies, withResultTypes: types)
    }
    
}
