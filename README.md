# **MKDataDetector for Swift**
[![Build Status](https://travis-ci.org/mayankk2308/mkdatadetector-swift.svg?branch=master)](https://travis-ci.org/mayankk2308/mkdatadetector-swift)
![Platform badge](https://img.shields.io/badge/platforms-iOS%20%7C%20macOS-blue.svg)

A simple convenience wrapper for data detection from natural language text that simplifies data extraction and handling.

Currently in the _**testing phase**_.

**Core Developers**: [Mayank Kumar](https://github.com/mayankk2308), [Jeet Parte](https://github.com/jeetparte) & [Pinak Jalan](https://github.com/pinakj).

## Purpose

While **Apple's** `NSDataDetector` is useful for extracting useful information from natural language text, it can sometimes be cumbersome to use and a little difficult to adopt. To circumvent this issue, we are developing an encapsulating framework called `MKDataDetector` to streamline the original API, simplify its usage, and build on it with additional supporting capabilities that use information effectively.

## Usage

On building the framework, you can immediately use basic functionality as an extension of `String`:
```swift
let testString: String = "sampleText"

// extract Dates
if let dates: [Date] = testString.dates {
    print(dates)
}

// extract Links
if let links: [URL] = testString.links {
    print(links)
}
```

Similar extensions exist for addresses, transit, and phone numbers as well.

For more informative responses, you can import and use the `MKDataDetectorService` class:
```swift
import MKDataDetector
```

To keep things simple, `MKDataDetectorService` is packaged as a set of extensions that compartmentalize its following capabilities:

* Date - date extraction
* Address - address extraction
* Link - link extraction
* Phone Number - phone number detection
* Transit Information - flight information extraction, etc.

In addition to extracting these features, the framework also provides convenience functions to manipulate and organize this data.

### Initialization

You can declare an instance as follows:
```swift
let dataDetectorService: MKDataDetectorService = MKDataDetectorService()
```

### Result Handling

For convenience, a generic `AnalysisResult<T>` structure is consistently returned for extraction/analysis results.

`AnalysisResult<T>` contains **3** fields:
* Source (`source`) - the source/original complete `String` from which data was detected
* Source Range (`rangeInSource`) - the `NSRange` of the matched string in the original string
* Data (`data`) - the data `T` extracted from the source input

Additionally, for convenience, the generic struct has a `typealias` per result type:
* `DateAnalysisResult` - for `AnalysisResult<Date>`
* `URLAnalysisResult` - for `AnalysisResult<URL>`
* `AddressAnalysisResult` - for `AnalysisResult<AddressInfo>`
* `PhoneNumberAnalysisResult` - for `AnalysisResult<String>`
* `TransitAnalysisResult` - for `AnalysisResult<TransitInfo>`

Because the address and transit information results are structures themselves (`[String : String]`), they are conveniently typealiased as `AddressInfo` and `TransitInfo`. For convenience, `Address` and `Transit` **_structs_** with the associated keys are provided for easy access. For example, to access the zip-code in an extracted address, simply use the key `Address.zip`.

### Implementation

To extract dates from some text (`String`):
```swift
if let results = dataDetectorService.extractDates(withTextBody: sampleTextBody) {
    for result in results {
        print(result.source)
        print(result.data)
        // do some stuff
    }
}
```
For a given `textBody`, the `dataDetectorService` returns an array of `DateAnalysisResult` objects.

To extract dates from multiple sources of text (`[String]`):
```swift
if let combinedResults = dataDetectorService.extractDates(withTextBodies: [sampleText, sampleText, ...]) {
    for individualResults in combinedResults where individualResults != nil {
        for result in individualResults! {
            print(result.source)
            print(result.data)
            // do some stuff
        }
    }
}
```
For given `textBodies`, the `dataDetectorService` returns an array of `[DateAnalysisResult]` objects.

The extraction process is uniform for other types of data features such as phone numbers, addresses, links, and more.

### Additional Capabilities

Besides data detection, `MKDataDetector` also provides handy convenience functions to use detected information.

To retrieve precise **location information** from a **valid** `String` address:
```swift
dataDetectorService.extractLocation(fromAddress: sampleText) { location in
    if extractedLocation = location {
        // CLLocation object available, requires importing 'CoreLocation'
    }
}
```

Alternatively, if you already have an `AddressAnalysisResult`:
```swift
dataDetectorService.extractLocation(fromAnalysisResult: sampleAnalysisResult) { location in
    if extractedLocation = location {
        // CLLocation object available, requires importing 'CoreLocation'
    }
}
```

For **calendar integration**, you can easily create events:
```swift
dataDetectorService.addEventToDefaultCalendar(withEventName: sampleText, withStartDate: sampleStartDate, withEndDate: sampleEndDate) { success in
    if success {
        // event added
    }
}
```

If you have a `DateAnalysisResult`, you can opt for easier event creation that also extracts the event name automatically:
```swift
dataDetectorService.addEventToDefaultCalendar(withAnalysisResult: sampleResult, withEndDate: sampleEndDate) { success in
    if success {
        // event added
    }
}
```

Note that automatic event name extraction may yield unexpected event names in rare cases. For concrete support, use the former function instead.

Additionally, the __*withEndDate*__ parameter is optional. Not providing a value defaults the event to end after an hour.

### Examples

Consider the following inputs:
```swift
let meeting: String = "Meeting at 9pm tomorrow"
let party: String = "Party next Friday at 8pm"
```

Using `dataDetectorService`'s `extractDates(withTextBody: String)` function, we receive the following output for `meeting`:
* `source` = *"Meeting at 9pm tomorrow"*
* `sourceInRange` = `NSRange` of the match *"at 9pm tomorrow"*
* `data` = equivalent `Date` object, specifying source date relative to the current date/time on the device

The output is similar for `party`:
* `source` = *"Party next Friday at 8pm"*
* `sourceInRange` = `NSRange` of the match *"next Friday at 8pm"*
* `data` = equivalent `Date` object, specifying source date relative to the current date/time on the device

The output format will be uniform for other types of data features as well, with the `data` field returning objects of the appropriate type in each case.

You can easily make use of this data, for instance, by adding the events to the user's calendar:
```swift
dataDetectorService.addEventToDefaultCalendar(withAnalysisResult: meetingAnalysisResult) { success in
    if success {
        // event added to default calendar as a "Meeting" with alarm set for "9pm tomorrow" - lasting an hour long (default)
    }
}

dataDetectorService.addEventToDefaultCalendar(withAnalysisResult: partyAnalysisResult) { success in
    if success {
        // event added to default calendar as a "Party" with alarm set for "8pm next Friday" - lasting an hour long (default)
    }
}
```

### Limitations

According to Apple's documentation on `NSDataDetector`, the class can currently match dates, addresses, links, phone numbers and transit information, and not other present properties such as grammar and spelling. They have been excluded from this framework as well.

Additionally, `NSDataDetector`, while having the facility of extracting airline information from natural language text, does not extract the names of airlines, and only retrieves the flight number data. We are looking into this.

## Contact

You can contact:
* Mayank Kumar - via [email](mailto:mayankk2308@gmail.com) or [LinkedIn](https://www.linkedin.com/in/mayank-kumar-478245b1/)
* Jeet Parte - via [email](mailto:jeetparte@gmail.com)
* Pinak Jalan - via [email](mailto:pinak.jalan@me.com)

for any inquires or community-related issues.

## License

This project is available under the [MIT](https://github.com/mayankk2308/mkdatadetector-swift/blob/master/LICENSE.md) license.
