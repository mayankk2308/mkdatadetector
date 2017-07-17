//
//  DataDetectorType.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/10/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation

extension MKDataDetectorService {
    
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
    
    internal func extractSource(fromTextBody textBody: String, usingRange range: NSRange) -> String {
        return (textBody as NSString).substring(with: range)
    }
    
}
