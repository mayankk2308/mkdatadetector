//
//  TransitInformation.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/9/17.
//  Copyright 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation

extension MKDataDetectorService {
    
    /// Retrieves transit information matched from a given body of text along with the range of each substring that matched.
    ///
    /// - Parameter textBody: A body of natural language text.
    /// - Returns: An array of `TransitAnalysisResult` instances or `nil` if no transit information could be found.
    public func extractTransitInformation(fromTextBody textBody: String) -> [TransitAnalysisResult]? {
        return extractData(fromTextBody: textBody, withResultTypes: [.transitInformation])
    }
    
    /// Retrieves transit information matched from the given bodies of text along with the range of each substring that matched.
    ///
    /// - Parameter textBodies: A set of multiple bodies of natural language text.
    /// - Returns: An array of `[TransitAnalysisResult]` instances or `nil` if no transit information could be found.
    /// - Note: Inside the returned array, a non-empty `[TransitAnalysisResult]` instance is returned for each text body which contains a match.
    public func extractTransitInformation(fromTextBodies textBodies: [String]) -> [[TransitAnalysisResult]]? {
        return extractData(fromTextBodies: textBodies, withResultTypes: [.transitInformation])
    }
    
}
