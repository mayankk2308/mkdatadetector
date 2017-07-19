//
//  AliasManager.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/19/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT License.
//

import CoreLocation

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

/// An `AnalysisResult` that represents an occurance of any information type that conforms to `AnalysisData`.
public typealias GenericAnalysisResult = AnalysisResult<AnalysisData>

/// A completion handler for determining success or failure of a task.
public typealias successCompletion = (Bool) -> Void

/// A completion handler that calls with a `CLLocation` object or `nil` if the object was not found.
public typealias locationCompletion = (CLLocation?) -> Void
