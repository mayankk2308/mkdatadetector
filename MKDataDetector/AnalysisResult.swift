//
//  AnalysisResult.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/10/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

/// - ToDo: Add description
public protocol AnalysisData {}

extension String: AnalysisData {}
extension Date: AnalysisData {}
extension URL: AnalysisData {}
extension Dictionary: AnalysisData {}

/// A generic struct used to describe items located by text checking. Each `AnalysisResult` represents an occurence of requested textual content found during analysis of a body of text.
public struct AnalysisResult<T> {
    public var source: String
    public var rangeInSource: NSRange
    public var dataString: String
    public var dataType: ResultType
    public var data: T
}

/// An address dictionary returned as part of an `AddressAnalysisResult`.
public typealias AddressInfo = Dictionary<String, String>
/// A transit dictionary returned as part of a `TransitAnalysisResult`.
public typealias TransitInfo = Dictionary<String, String>
/// An `AnalysisResult` that represents an occurence of a phone number found during analysis of a body of text.
public typealias PhoneNumberAnalysisResult = AnalysisResult<String>
/// An `AnalysisResult` that represents an occurence of a date found during analysis of a body of text.
public typealias DateAnalysisResult = AnalysisResult<Date>
/// An `AnalysisResult` that represents an occurence of a URL found during analysis of a body of text.
public typealias URLAnalysisResult = AnalysisResult<URL>
/// An `AnalysisResult` that represents an occurence of an address component found during analysis of a body of text.
public typealias AddressAnalysisResult = AnalysisResult<AddressInfo>
/// An `AnalysisResult` that represents an occurence of transit information found during analysis of a body of text.
public typealias TransitAnalysisResult = AnalysisResult<TransitInfo>
/// - ToDo: Add description
public typealias GenericAnalysisResult = AnalysisResult<AnalysisData>
