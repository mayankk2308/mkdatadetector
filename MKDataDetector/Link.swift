//
//  Link.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/9/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation

extension MKDataDetectorService {
    
    public func extractLinks(fromTextBody textBody: String) -> [URLAnalysisResult]? {
        return extractData(fromTextBody: textBody, withResultType: .link)
    }
    
    public func extractLinks(fromTextBodies textBodies: [String]) -> [[URLAnalysisResult]?]? {
        return extractData(fromTextBodies: textBodies, withResultType: .link)
    }

}
