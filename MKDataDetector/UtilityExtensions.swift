//
//  DataDetectorType.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/10/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

import Foundation

extension MKDataDetectorService {
    
    internal func dataDetectorOfType(withResultType resultType: ResultType) -> NSDataDetector? {
        do {
            switch resultType {
            case .date:
                return try NSDataDetector(types: NSTextCheckingResult.CheckingType.date.rawValue)
            case .address:
                return try NSDataDetector(types: NSTextCheckingResult.CheckingType.address.rawValue)
            case .link:
                return try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            case .phoneNumber:
                return try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
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
        case .link:
            return match.url as? T
        case .phoneNumber:
            return match.phoneNumber as? T
        default:
            return nil
        }
    }
    
    internal func extractSource(fromTextBody textBody: String, usingRange range: NSRange) -> String {
        return (textBody as NSString).substring(with: range)
    }
    
}

extension Dictionary {
    
    static func += <K, V>(left: inout [K:V], right: [K:V]) {
        for (k, v) in right {
            left[k] = v
        } 
    }
    
}
