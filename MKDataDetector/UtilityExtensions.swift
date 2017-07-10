//
//  DataDetectorType.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/10/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

import Foundation

extension MKDataDetectorService {
    
    internal func dataDetectorOfType<T>(forType type: T.Type) -> NSDataDetector? {
        do {
            if type == Date.self {
                return try NSDataDetector(types: NSTextCheckingResult.CheckingType.date.rawValue)
            }
            else if type == URL.self {
                return try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            }
            // and so on
        }
        catch {
            fatalError("could not initialize detector")
        }
        return nil
    }
    
    internal func extractSource(fromTextBody textBody: String, usingRange range: NSRange) -> String {
        return (textBody as NSString).substring(with: range)
    }
    
}
