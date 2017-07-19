//
//  StringAccess.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/16/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation
#if os(OSX)
    import Cocoa
#elseif os(iOS)
    import UIKit
#endif

public extension String {
    
    /// Retrieves an array of matched dates in the string or `nil` if no matches could be found.
    var dates: [Date]? {
        return retrieveMappedData(withResultType: .date)
    }
    
    /// Retrieves an array of matched links in the string or `nil` if no matches could be found.
    var links: [URL]? {
        return retrieveMappedData(withResultType: .link)
    }
    
    /// Retrieves an array of matched addresses in the string or `nil` if no matches could be found.
    var addresses: [AddressInfo]? {
        return retrieveMappedData(withResultType: .address)
    }
    
    /// Retrieves an array of matched phone numbers in the string or `nil` if no matches could be found.
    var phoneNumbers: [String]? {
        return retrieveMappedData(withResultType: .phoneNumber)
    }
    
    /// Retrieves an array of matched transit information in the string or `nil` if no matches could be found.
    var transitInfo: [TransitInfo]? {
        return retrieveMappedData(withResultType: .transitInformation)
    }
    
    /// Retrieves generic data for a requested result type.
    ///
    /// - Parameter type: The type to match.
    /// - Returns: An array of generic results or `nil` if no matches could be found.
    private func retrieveMappedData<T>(withResultType type: ResultType) -> [T]? {
        let dataDetectorService = MKDataDetectorService()
        guard let results: [AnalysisResult<T>] = dataDetectorService.extractData(fromTextBody: self, withResultTypes: [type]) else { return nil }
        return results.flatMap { $0.data }
    }
    
}

internal extension String {
    
    /// The string with additional whitespaces condensed to a single whitespace.
    var condensedWhitespace: String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
    
}

extension MKDataDetectorService {
    
    /// Generates attributed text for the user interface given a set of analysis results on a text body.
    ///
    /// - Parameters:
    ///   - results: An array of analysis results.
    ///   - color: A color for highlighting matches.
    /// - Returns: An attributed string on the basis of the matches.
    public func attributedText<T>(fromAnalysisResults results: [AnalysisResult<T>], withColor color: CGColor) -> NSMutableAttributedString? {
        guard let firstResult = results.first else { return nil }
        let attributedString = NSMutableAttributedString(string: firstResult.source)
        for result in results {
            #if os(iOS)
                attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor(cgColor: color), range: result.rangeInSource)
            #elseif os(OSX)
                attributedString.addAttribute(NSForegroundColorAttributeName, value: NSColor(cgColor: color) as Any, range: result.rangeInSource)
            #endif
        }
        return attributedString
    }
    
}
