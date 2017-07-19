//
//  Link.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/9/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation

extension MKDataDetectorService {
    
    /// Retrieves URL links matched from a given body of text along with the range of each substring that matched.
    ///
    /// - Parameter textBody: A body of natural language text.
    /// - Returns: An array of `URLAnalysisResult` instances or `nil` if no links could be found.
    public func extractLinks(fromTextBody textBody: String) -> [URLAnalysisResult]? {
        return extractData(fromTextBody: textBody, withResultTypes: [.link])
    }
    
    /// Retrieves URL links matched from the given bodies of text along with the range of each substring that matched.
    ///
    /// - Parameter textBodies: A set of multiple bodies of natural language text.
    /// - Returns: An array of `[URLAnalysisResult]` instances or `nil` if no links could be found.
    /// - Note: Inside the returned array, a non-empty `[URLAnalysisResult]` instance is returned for each text body which contains a match.
    public func extractLinks(fromTextBodies textBodies: [String]) -> [[URLAnalysisResult]]? {
        return extractData(fromTextBodies: textBodies, withResultTypes: [.link])
    }

}
