//
//  PhoneNumber.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/9/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation
import Contacts

extension MKDataDetectorService {
    
    public func extractPhoneNumbers(fromTextBody textBody: String) -> [PhoneNumberAnalysisResult]? {
        return extractData(fromTextBody: textBody, withResultType: .phoneNumber)
    }
    
    public func extractPhoneNumbers(fromTextBodies textBodies: [String]) -> [[PhoneNumberAnalysisResult]?]? {
        return extractData(fromTextBodies: textBodies, withResultType: .phoneNumber)
    }

}
