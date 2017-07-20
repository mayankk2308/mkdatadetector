//
//  Date.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/9/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
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
    
    /// Adds events to the default device calendar using a date analysis result.
    ///
    /// - Parameters:
    ///   - result: A date analysis result.
    ///   - endDate: The end date for the event.
    ///   - completion: Provides confirmation or failure of the execution of the task.
    /// - Note: The `endDate` parameter is optional. Not providing this property defaults the event to end an hour from the detected starting time. Additionally, this function automatically determines the event name. This may sometimes yield unexpected results.
    public func addEventToDefaultCalendar(withAnalysisResult result: DateAnalysisResult, withEndDate endDate: Date? = nil, onCompletion completion: @escaping successCompletion) {
        let eventName = (result.source as NSString).replacingCharacters(in: result.rangeInSource, with: "").condensedWhitespace.trimmingCharacters(in: .whitespaces)
        addEventToDefaultCalendar(withEventName: eventName, withStartDate: result.data, withEndDate: endDate, onCompletion: completion)
    }
    
    /// Adds events to the default device calendar given specific details.
    ///
    /// - Parameters:
    ///   - name: The name of the event
    ///   - startDate: The start date of the event
    ///   - possibleEndDate: The end date of the event
    ///   - completion: Provides confirmation or failure of the execution of the task.
    /// - Note: The `endDate` parameter is optional. Not providing this property defaults the event to end an hour from the detected starting time.
    public func addEventToDefaultCalendar(withEventName name: String, withStartDate startDate: Date, withEndDate possibleEndDate: Date? = nil, onCompletion completion: @escaping successCompletion) {
        let eventStore = EKEventStore()
        let endDate: Date
        if let extractedEndDate = possibleEndDate {
            endDate = extractedEndDate
        } else {
            endDate = startDate.addingTimeInterval(TimeInterval(3600))
        }
        switch EKEventStore.authorizationStatus(for: .event) {
        case .authorized:
            insertEvent(withEventStore: eventStore, withEventName: name, withStartDate: startDate, withEndDate: endDate, onCompletion: completion)
            break
        default:
            eventStore.requestAccess(to: .event) { access, error in
                if access {
                    self.insertEvent(withEventStore: eventStore, withEventName: name, withStartDate: startDate, withEndDate: endDate, onCompletion: completion)
                }
                else {
                    if let errorMessage = error {
                        print("Calendar access error: \(errorMessage)")
                    }
                    completion(false)
                }
            }
            completion(false)
        }
    }
    
    /// Helper for inserting events into the event store.
    ///
    /// - Parameters:
    ///   - store: The event store.
    ///   - name: The name of the event.
    ///   - startDate: The start date of the event.
    ///   - endDate: The end date of the event
    ///   - completion: Provides confirmation or failure of the executation of the task.
    internal func insertEvent(withEventStore store: EKEventStore, withEventName name: String, withStartDate startDate: Date, withEndDate endDate: Date, onCompletion completion: successCompletion) {
        let event = EKEvent(eventStore: store)
        event.title = name
        event.startDate = startDate
        event.endDate = endDate
        event.alarms = [EKAlarm(relativeOffset: TimeInterval(-900))]
        event.calendar = store.defaultCalendarForNewEvents
        do {
            try store.save(event, span: .thisEvent, commit: true)
            completion(true)
        } catch {
            print(error)
            completion(false)
        }
    }
    
}
