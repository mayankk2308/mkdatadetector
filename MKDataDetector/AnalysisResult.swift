//
//  AnalysisResult.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/10/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

/// Defines types that may be retrieved as analysis result data.
public protocol AnalysisData {}

extension String: AnalysisData {}
extension Date: AnalysisData {}
extension URL: AnalysisData {}
extension Dictionary: AnalysisData {}

/// A generic struct used to describe items located by text checking. Each `AnalysisResult` represents an occurence of requested textual content found during analysis of a body of text.
public struct AnalysisResult<T> {
    
    /// The entire text body in which the matched substring was contained.
    public var source: String
    
    /// The range of the matched portion of the text body.
    public var rangeInSource: NSRange
    
    /// The substring corresponding to the matched portion of the text body.
    public var dataString: String
    
    /// The `ResultType` corresponding to the data being returned.
    public var dataType: ResultType
    
    /// The data extracted from the source input.
    public var data: T
}
