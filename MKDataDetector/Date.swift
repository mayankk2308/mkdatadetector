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
    
    public func extractDates(fromTextBody textBody: String) -> [DateAnalysisResult]? {
        return extractData(fromTextBody: textBody, withResultType: .date)
    }
    
    public func extractDates(fromTextBodies textBodies: [String]) -> [[DateAnalysisResult]?]? {
        return extractData(fromTextBodies: textBodies, withResultType: .date)
    }
    
    public func addEventToDefaultCalendar(withEventName name: String, withStartDate startDate: Date, withEndDate endDate: Date, onCompletion completion: @escaping (Bool) -> Void) {
        let eventStore = EKEventStore()
        switch EKEventStore.authorizationStatus(for: .event) {
        case .authorized:
            insertEvent(withEventStore: eventStore, withEventName: name, withStartDate: startDate, withEndDate: endDate, onCompletion: completion)
            break
        case .notDetermined:
            eventStore.requestAccess(to: .event) { access, error in
                if access {
                    self.insertEvent(withEventStore: eventStore, withEventName: name, withStartDate: startDate, withEndDate: endDate, onCompletion: completion)
                }
                else {
                    if let errorMessage = error {
                        print("Calendar access not granted with error: \(errorMessage)")
                    }
                    completion(false)
                }
            }
            break
        default:
            completion(false)
        }
    }
    
    internal func insertEvent(withEventStore store: EKEventStore, withEventName name: String, withStartDate startDate: Date, withEndDate endDate: Date, onCompletion completion: (Bool) -> Void) {
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
