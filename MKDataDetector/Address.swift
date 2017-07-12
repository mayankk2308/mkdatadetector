//
//  Address.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/9/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation

extension MKDataDetectorService {
    
    public func extractAddresses(fromTextBody textBody: String) -> [AddressAnalysisResult?]? {
        return extractData(fromTextBody: textBody, withResultType: .address)
    }
    
    public func extractAddresses(fromTextBodies textBodies: [String]) -> [[AddressAnalysisResult?]?]? {
        return extractData(fromTextBodies: textBodies, withResultType: .address)
    }
    
}
