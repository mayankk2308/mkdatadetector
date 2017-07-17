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
    
    var dates: [Date]? {
        return retrieveMappedData(withResultType: .date)
    }
    
    var links: [URL]? {
        return retrieveMappedData(withResultType: .link)
    }
    
    var addresses: [[String : String]]? {
        return retrieveMappedData(withResultType: .address)
    }
    
    var phoneNumbers: [String]? {
        return retrieveMappedData(withResultType: .phoneNumber)
    }
    
    var transitInfo: [[String : String]]? {
        return retrieveMappedData(withResultType: .transitInformation)
    }
    
    private func retrieveMappedData<T>(withResultType type: ResultType) -> [T]? {
        let dataDetectorService = MKDataDetectorService()
        guard let results: [AnalysisResult<T>] = dataDetectorService.extractData(fromTextBody: self, withResultType: type) else { return nil }
        return results.flatMap { $0.data }
    }
    
}

internal extension String {
    
    var condensedWhitespace: String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
    
}

extension MKDataDetectorService {
    
    public func attributedText<T>(fromAnalysisResults results: [AnalysisResult<T>], withColor color: CGColor) -> NSMutableAttributedString? {
        guard let firstResult = results.first else { return nil }
        let attributedString = NSMutableAttributedString(string: firstResult.source)
        for result in results {
            attributedString.addAttribute(NSForegroundColorAttributeName, value: color, range: result.rangeInSource)
        }
        return attributedString
    }
    
}
