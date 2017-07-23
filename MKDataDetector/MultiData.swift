//
//  MultiData.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/17/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation

extension MKDataDetectorService {
    
    /// Retrieves multiple types of information from a given body of text along with the range of each substring that matched.
    ///
    /// - Parameters:
    ///   - textBody: A body of natural language text.
    ///   - types: The types of data to detect.
    /// - Returns: An array of `GenericAnalysisResult` instances or `nil` if matches could not be found.
    public func extractInformation(fromTextBody textBody: String, withResultTypes types: ResultType ...) -> [GenericAnalysisResult]? {
        return types.isEmpty ? nil : extractData(fromTextBody: textBody, withResultTypes: types)
    }
    
    /// Retrieves multiple types of information from the given bodies of text along with the range of each substring that matched. 
    ///
    /// - Parameters:
    ///   - textBodies: An array of multiple bodies of natural language text.
    ///   - types: The types of data to detect.
    /// - Returns: An array of `[GenericAnalysisResult]` instances or `nil` if matches could not be found.
    /// - Note: Inside the returned array, a non-empty `[GenericAnalysisResult]` instance is returned for each text body which contains a match.
    public func extractInformation(fromTextBodies textBodies: [String], withResultTypes types: ResultType ...) -> [[GenericAnalysisResult]]? {
        return types.isEmpty ? nil : extractData(fromTextBodies: textBodies, withResultTypes: types)
    }
    
}
