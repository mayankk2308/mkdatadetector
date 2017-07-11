//
//  DataDetectorType.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/10/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

import Foundation

extension MKDataDetectorService {
    
    internal func dataDetectorOfType<T>(forType type: T.Type, withResultType resultType: ResultType) -> NSDataDetector? {
        do {
            switch resultType {
            case .date:
                return try NSDataDetector(types: NSTextCheckingResult.CheckingType.date.rawValue)
            case .address:
                return try NSDataDetector(types: NSTextCheckingResult.CheckingType.address.rawValue)
            case .correction:
                return try NSDataDetector(types: NSTextCheckingResult.CheckingType.correction.rawValue)
            case .grammar:
                return try NSDataDetector(types: NSTextCheckingResult.CheckingType.grammar.rawValue)
            case .link:
                return try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            case .phoneNumber:
                return try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            case .replacement:
                return try NSDataDetector(types: NSTextCheckingResult.CheckingType.replacement.rawValue)
            case .spelling:
                return try NSDataDetector(types: NSTextCheckingResult.CheckingType.spelling.rawValue)
            default:
                return nil
            }
        }
        catch {
            fatalError("could not initialize detector")
        }
        return nil
    }
    
    internal func retrieveData<T>(fromMatch match: NSTextCheckingResult, withResultType type: ResultType) -> T? {
        switch type {
        case .date:
            return match.date as? T
        case .address:
            return match.addressComponents as? T
        case .correction:
            // TODO
            return nil
        case .grammar:
            // TODO
            return nil
        case .link:
            return match.url as? T
        case .phoneNumber:
            return match.phoneNumber as? T
        case .replacement:
            return match.replacementString as? T
        case .spelling:
            // TODO
            return nil
        default:
            return nil
        }
    }
    
    internal func extractSource(fromTextBody textBody: String, usingRange range: NSRange) -> String {
        return (textBody as NSString).substring(with: range)
    }
    
}
