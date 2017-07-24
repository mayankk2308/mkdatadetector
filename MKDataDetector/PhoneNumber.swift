//
//  PhoneNumber.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/9/17.
//  Copyright 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation

extension MKDataDetectorService {
    
    /// Retrieves phone numbers matched from a given body of text along with the range of each substring that matched.
    ///
    /// - Parameter textBody: A body of natural language text.
    /// - Returns: An array of `PhoneNumberAnalysisResult` instances or `nil` if no phone numbers could be found.
    public func extractPhoneNumbers(fromTextBody textBody: String) -> [PhoneNumberAnalysisResult]? {
        return extractData(fromTextBody: textBody, withResultTypes: [.phoneNumber])
    }
    
    /// Retrieves phone numbers matched from the given bodies of text along with the range of each substring that matched.
    ///
    /// - Parameter textBodies: A set of multiple bodies of natural language text.
    /// - Returns: An array of `[PhoneNumberAnalysisResult]` instances or `nil` if no phone numbers could be found.
    /// - Note: Inside the returned array, a non-empty `[PhoneNumberAnalysisResult]` instance is returned for each text body which contains a match.
    public func extractPhoneNumbers(fromTextBodies textBodies: [String]) -> [[PhoneNumberAnalysisResult]]? {
        return extractData(fromTextBodies: textBodies, withResultTypes: [.phoneNumber])
    }

}
