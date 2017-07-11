//
//  PhoneNumber.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/9/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

import Foundation

extension MKDataDetectorService {
    
    public func extractPhoneNumbers(withTextBody textBody: String) -> [PhoneNumberAnalysisResult?]? {
        return extractData(withTextBody: textBody, withResultType: .phoneNumber)
    }
    
    public func extractPhoneNumbers(withTextBodies textBodies: [String]) -> [[PhoneNumberAnalysisResult?]?]? {
        return extractData(withTextBodies: textBodies, withResultType: .phoneNumber)
    }
    
}
