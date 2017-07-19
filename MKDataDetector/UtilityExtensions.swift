//
//  DataDetectorType.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/10/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation

extension MKDataDetectorService {
    
    /// Supporting utility for generating an appropriate detector.
    ///
    /// - Parameter resultTypes: The types to detect.
    /// - Returns: An `NSDataDetector` or `nil` if it could not be instantiated.
    internal func dataDetectorOfType(withResultTypes resultTypes: [ResultType]) -> NSDataDetector? {
        do {
            var checkingTypes = NSTextCheckingResult.CheckingType()
            for resultType in resultTypes {
                guard let type = checkingTypeMap[resultType] else { return nil }
                checkingTypes.insert(type)
            }
            return checkingTypes.isEmpty ? nil : try NSDataDetector(types: checkingTypes.rawValue)
        } catch { return nil }
    }
    
    
    /// Supporting utility for retrieving results from matches with appropriate type.
    ///
    /// - Parameters:
    ///   - match: An `NSTextCheckingResult` instance.
    ///   - type: The type of match.
    /// - Returns: The result of the match casted generically.
    internal func retrieveData<T>(fromMatch match: NSTextCheckingResult, withMatchType type: NSTextCheckingResult.CheckingType) -> T? {
        switch type {
        case NSTextCheckingResult.CheckingType.date:
            return match.date as? T
        case NSTextCheckingResult.CheckingType.address:
            return match.addressComponents as? T
        case NSTextCheckingResult.CheckingType.link:
            return match.url as? T
        case NSTextCheckingResult.CheckingType.phoneNumber:
            return match.phoneNumber as? T
        default:
            return match.components as? T
        }
    }
    
    /// Supporting utility for generating a substring from a string given a range.
    ///
    /// - Parameters:
    ///   - textBody: A body of natural language text.
    ///   - range: The range of the target substring.
    /// - Returns: A substring of `textBody` based on the `range`.
    internal func extractSource(fromTextBody textBody: String, usingRange range: NSRange) -> String {
        return (textBody as NSString).substring(with: range)
    }
    
}
