//
//  Address.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/9/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation
import CoreLocation

extension MKDataDetectorService {

    /// Retrieves address components matched from a given body of text along with the range of each substring that matched.
    ///
    /// - Parameter textBody: A body of natural language text.
    /// - Returns: An array of `AddressAnalysisResult` instances or `nil` if no address components could be found.
    public func extractAddresses(fromTextBody textBody: String) -> [AddressAnalysisResult]? {
        return extractData(fromTextBody: textBody, withResultTypes: [.address])
    }

    /// Retrieves address components matched from the given bodies of text along with the range of each substring that matched.
    ///
    /// - Parameter textBodies: A set of multiple bodies of natural language text.
    /// - Returns: An array of `[AddressAnalysisResult]` instances or `nil` if no address components could be found.
    /// - Note: Inside the returned array, a non-empty `[AddressAnalysisResult]` instance is returned for each text body which contains a match.
    public func extractAddresses(fromTextBodies textBodies: [String]) -> [[AddressAnalysisResult]]? {
        return extractData(fromTextBodies: textBodies, withResultTypes: [.address])
    }

    /// Retrieves the geographic location of an address analysis result.
    ///
    /// - Parameters:
    ///   - result: The address analysis result.
    ///   - completion: Called with a `CLLocation` object, which will be `nil` if it could not be generated.
    public func extractLocation(fromAnalysisResult result: AddressAnalysisResult, onCompletion completion: @escaping locationCompletion) {
        extractLocation(fromAddress: result.source, onCompletion: completion)
    }

    /// Retrieves the geographic location of a valid address.
    ///
    /// - Parameters:
    ///   - address: A valid address.
    ///   - completion: Called with a `CLLocation` object, which will be `nil` if it could not be generated.
    public func extractLocation(fromAddress address: String, onCompletion completion: @escaping locationCompletion) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            guard let location = self.extractLocation(fromPlacemarks: placemarks, withError: error) else { return }
            completion(location)
        }
    }

    /// Retrieves the geographic location obtained from the first placemark.
    ///
    /// - Parameters:
    ///   - placemarks: An array of placemarks.
    ///   - error: An error that may have occurred in retrieval.
    /// - Returns: A `CLLocation` object or `nil` if it could not be generated.
    internal func extractLocation(fromPlacemarks placemarks: [CLPlacemark]?, withError error: Error?) -> CLLocation? {
        if error == nil {
            guard let placemarks = placemarks, let placemark = placemarks.first else { return nil }
            return placemark.location
        }
        return nil
    }
}
