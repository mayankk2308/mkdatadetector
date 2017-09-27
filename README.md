# **MKDataDetector**
[![Build Status](https://travis-ci.org/mayankk2308/mkdatadetector-swift.svg?branch=master)](https://travis-ci.org/mayankk2308/mkdatadetector-swift)
![Platform badge](https://img.shields.io/badge/platforms-iOS%20%7C%20macOS-blue.svg)

A simple convenience wrapper in Swift for data detection from natural language text that organizes data extraction and handling.

## Purpose

`MKDataDetector` streamlines `NSDataDetector` and builds on it with additional supporting capabilities that use information effectively.

## Requirements

* Swift 3.1+
* macOS 10.9+
* iOS 8.0+

## Installation

There are multiple installation options to choose from.

### CocoaPods (Preferred)

To install via CocoaPods, add the following line to your **Podfile**:
```ruby
pod 'MKDataDetector'
```

### Carthage

To install via Carthage, add the following line to your **Cartfile** along with the specific version of the framework you might prefer:
```
github "mayankk2308/mkdatadetector-swift"
```

### Manual

1. Create a submodule in your project directory: `git submodule add https://github.com/mayankk2308/mkdatadetector-swift.git`
2. Open the submodule directory and drag the **.xcodeproj** file into your project.
3. Add **MKDataDetector.framework** to your target's _Link Binary with Libraries_ **Build Phase**.
4. You can now use the framework by importing it.

## Usage

`MKDataDetectorService` is packaged as a set of extensions that compartmentalize its following capabilities:

* Date - date extraction
* Address - address extraction
* Link - link extraction
* Phone Number - phone number detection
* Transit Information - flight information extraction, etc.

In addition to extracting these features, the framework also provides convenience functions to manipulate and organize this data.

To import and use the `MKDataDetectorService` class, add the following statement to your `.swift` file:
```swift
import MKDataDetector
```

You can use basic functionality as an extension of `String`:
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

Similar extensions exist for addresses, transit, and phone numbers as well. For more informative results, you may want to initialize the service.

### Initialization

You can declare an instance as follows:
```swift
let dataDetectorService: MKDataDetectorService = MKDataDetectorService()
```

### Result Handling

A generic set of `AnalysisResult<T>` structures is consistently returned for extraction/analysis results. An enumeration called `ResultType` is also included for identification of results.

`AnalysisResult<T>` contains **5** fields:
* Source (`source`) - the source/original complete `String` from which data was detected
* Match Range (`rangeInSource`) - the `NSRange` of the matched string in the original string
* Data String (`dataString`) - the substring from which `data` was matched
* Data Type (`dataType`) - the type `ResultType` of data returned
* Data (`data`) - the data `T` extracted from the source input

The generic struct has a `typealias` per result type:
* `DateAnalysisResult` - for `AnalysisResult<Date>`
* `URLAnalysisResult` - for `AnalysisResult<URL>`
* `AddressAnalysisResult` - for `AnalysisResult<AddressInfo>`
* `PhoneNumberAnalysisResult` - for `AnalysisResult<String>`
* `TransitAnalysisResult` - for `AnalysisResult<TransitInfo>`

The address and transit information results are structures (`[String : String]`) typealiased as `AddressInfo` and `TransitInfo`. `Address` and `Transit` **_structs_** with their associated dictionary keys make information lookup simple. For example, to access the zip-code in an extracted address, simply use the key `Address.zip`.

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
    for individualResults in combinedResults {
        for result in individualResults {
            print(result.source)
            print(result.data)
            // do some stuff
        }
    }
}
```
For given `textBodies`, the `dataDetectorService` returns an array of `[DateAnalysisResult]` objects.

The extraction process is uniform for other types of data features such as phone numbers, addresses, links, and more.

In cases where detection with multiple `ResultType`s are required, the following implementation may be used:
```swift
if let results = dataDetectorService.extractInformation(fromTextBody textBody: String, withResultTypes: .date, .address ...) {
    for result in results {
        switch result.dataType {
            case .date:
            // force cast as DateAnalysisResult - create and save events, etc.
            case .address:
            // force cast as AddressAnalysisResult - get location, etc.
            .
            .
            // for all result types you are concerned with, i.e, your input parameters
        }
    }
}
```

An implementation for extracting multiple types from multiple text bodies is also included.

### Additional Capabilities

`MKDataDetector` also provides handy convenience functions to use detected information.

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

For **calendar integration**, you can easily create an `EKEvent` from a `DateAnalysisResult`:
```swift
let event: EKEvent = dataDetectorService.generateEvent(fromEventStore: sampleEventStore, withAnalysisResult: sampleResult)
```
A __*withEndDate*__ parameter, not shown above, is optional. Not providing a value defaults the event to end after an hour.

A more generic event generator is also available, which may be preferred if 100% event naming consistency is expected. Automatic processing of event names from `DateAnalysisResult` objects needs more testing.

Given a set of retrieved `AnalysisResult<T>` (the default result type for any extraction operation), you can generate **colored attributed texts**:
```swift
if let attributedText = dataDetectorService.attributedText(fromAnalysisResults: sampleResults, withColor: UIColor.blue.cgcolor) {
    // set UI component
}
```

More convenience capabilities will be incorporated into future releases.

### Examples

Consider the following inputs:
```swift
let meeting: String = "Meeting at 9pm tomorrow"
let party: String = "Party next Friday at 8pm"
```

Extracting dates using `dataDetectorService`, we receive the following output for `meeting`:
* `source` = *"Meeting at 9pm tomorrow"*
* `sourceInRange` = `NSRange` of the match *"at 9pm tomorrow"*
* `dataString` = the match substring *"at 9pm tomorrow"*
* `data` = equivalent `Date` object, specifying source date relative to the current date/time on the device

The output is similar for `party`:
* `source` = *"Party next Friday at 8pm"*
* `sourceInRange` = `NSRange` of the match *"next Friday at 8pm"*
* `dataString` = the match substring *"next Friday at 8pm"*
* `data` = equivalent `Date` object, specifying source date relative to the current date/time on the device

The output format will be uniform for other types of data features as well, with the `data` field returning objects of the appropriate type in each case.

You can easily make use of this data, for instance, by generating an event:
```swift
let meetingEvent = dataDetectorService.generateEvent(withEventStore: someEventStore, withAnalysisResult: meetingAnalysisResult)
// creates an event detailing a meeting for 9pm tomorrow, lasting an hour

let partyEvent = dataDetectorService.generateEvent(withEventStore: someEventStore, withAnalysisResult: partyAnalysisResult)
// creates an event detailing a party at 8pm next Friday, lasting an hour
```

Assume that the `meeting` text was embedded in a `UILabel` called `meetingLabel`. It was also expanded to add *" and next Friday at 5pm"*. You can update the label to display the **multiple detected** parts of the text:
```swift
if let attributedText = dataDetectorService.attributedText(withAnalysisResults: meetingAnalysisResult, withColor: UIColor.purple.cgcolor) {
    meetingLabel.attributedText = attributedText
}
```

`meetingLabel` will now display the original text with the detected information in purple (bold here):
*"Meeting __at 9pm tomorrow__ and __next Friday at 5pm__"*.

### Limitations

Apple's documentation on `NSDataDetector` states that the class can currently match dates, addresses, links, phone numbers and transit information, and not other present properties such as grammar and spelling.

Additionally, `NSDataDetector` does not detect:
* the **name**, **job title**, **organization** & **phone number** components of an address, although keys for the same are provided within the original API
* the **airline name** component for transit information, although a key for this is available in the original API

## Contact

You can contact:
* [Mayank Kumar](https://github.com/mayankk2308) - via [email](mailto:mayankk2308@gmail.com) or [LinkedIn](https://www.linkedin.com/in/mayank-kumar-478245b1/)
* [Jeet Parte](https://github.com/jeetparte) - via [email](mailto:jeetparte@gmail.com)

for any inquires or community-related issues.

## License

This project is available under the [MIT](https://github.com/mayankk2308/mkdatadetector-swift/blob/master/LICENSE.md) license.
