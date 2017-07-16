//
//  DataDetectorType.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/10/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation

extension MKDataDetectorService {
    
    internal func dataDetectorOfType(withResultType resultType: ResultType) -> NSDataDetector? {
        do {
            guard let detectorType = checkingTypeMap[resultType] else { return nil }
            return try NSDataDetector(types: detectorType)
        } catch { return nil }
    }
    
    internal func retrieveData<T>(fromMatch match: NSTextCheckingResult, withResultType type: ResultType) -> T? {
        switch type {
        case .date:
            return match.date as? T
        case .address:
            return match.addressComponents as? T
        case .link:
            return match.url as? T
        case .phoneNumber:
            return match.phoneNumber as? T
        case .transitInformation:
            return match.components as? T
        }
    }
    
    internal func extractSource(fromTextBody textBody: String, usingRange range: NSRange) -> String {
        return (textBody as NSString).substring(with: range)
    }
    
}
