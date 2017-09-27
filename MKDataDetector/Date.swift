//
//  Date.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/9/17.
//  Copyright 2017 Mayank Kumar. Available under the MIT license.
//

import EventKit
import Foundation

extension MKDataDetectorService {
    
    /// Retrieves dates matched from a given body of text along with the range of each substring that matched.
    ///
    /// - Parameter textBody: A body of natural language text.
    /// - Returns: An array of `DateAnalysisResult` instances or `nil` if no dates could be found.
    public func extractDates(fromTextBody textBody: String) -> [DateAnalysisResult]? {
        return extractData(fromTextBody: textBody, withResultTypes: [.date])
    }
    
    /// Retrieves dates matched from the given bodies of text along with the range of each substring that matched.
    ///
    /// - Parameter textBodies: A set of multiple bodies of natural language text.
    /// - Returns: An array of `[DateAnalysisResult]` instances or `nil` if no dates could be found.
    /// - Note: Inside the returned array, a non-empty `[DateAnalysisResult]` instance is returned for each text body which contains a match.
    public func extractDates(fromTextBodies textBodies: [String]) -> [[DateAnalysisResult]]? {
        return extractData(fromTextBodies: textBodies, withResultTypes: [.date])
    }
    
    
    /// Generates an `EKEvent` for a given analysis result and event store.
    ///
    /// - Parameters:
    ///   - store: The event store for which to generate the event.
    ///   - result: The `DateAnalysisResult` previously procured from analysis.
    ///   - endDate: The user-specified end date -  defaults to an hour from start date otherwise.
    /// - Returns: The generated event.
    ///
    /// - Note: This function auto-generates the event name based on date analysis. This feature requires additional testing and may not always yield satisfactory results. The default generator is exposed for use.
    public func generateEvent(forEventStore store: EKEventStore, withAnalysisResult result: DateAnalysisResult, withEndDate endDate: Date? = nil) -> EKEvent {
        let eventName = (result.source as NSString).replacingCharacters(in: result.rangeInSource, with: "").condensedWhitespace.trimmingCharacters(in: .whitespaces)
        let extractedDate: Date = endDate != nil ? endDate! : result.data.addingTimeInterval(3600)
        return generateEvent(forEventStore: store, withEventName: eventName, withStartDate: result.data, withEndDate: extractedDate)
    }
    
    
    /// Generates an `EKEvent` for a given set of precise data along with an event store.
    ///
    /// - Parameters:
    ///   - store: The event store for which to generate the event.
    ///   - name: The name of the event.
    ///   - startDate: The start date/time of the event.
    ///   - endDate: The end date/time of the event.
    /// - Returns: The generated event.
    public func generateEvent(forEventStore store: EKEventStore, withEventName name: String, withStartDate startDate: Date, withEndDate endDate: Date) -> EKEvent {
        let event = EKEvent(eventStore: store)
        event.title = name
        event.startDate = startDate
        event.endDate = endDate
        return event
    }
    
}
