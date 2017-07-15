# **MKDataDetector for Swift**
[![Build Status](https://travis-ci.org/mayankk2308/mkdatadetector-swift.svg?branch=master)](https://travis-ci.org/mayankk2308/mkdatadetector-swift)
![Platform badge](https://img.shields.io/badge/platforms-iOS%20%7C%20macOS-brightgreen.svg)
[![apm](https://img.shields.io/apm/l/vim-mode.svg)]()

A simple convenience wrapper for data detection from natural language text that simplifies data extraction and handling.

Currently in the _**initial testing phase**_.

**Core Developers**: [Mayank Kumar](https://github.com/mayankk2308), [Jeet Parte](https://github.com/jeetparte) & [Pinak Jalan](https://github.com/pinakj).

## Purpose

While **Apple's** `NSDataDetector` is useful for extracting useful information from natural language text, it can be cumbersome to use and a little difficult to adopt. To circumvent this issue, we are developing an encapsulating framework called `MKDataDetector` to streamline the original API and simplify its usage and application.

## Usage

After installing the framework into your project, you can easily access the `MKDataDetectorService` class by importing the framework in your swift files:
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

`AnalysisResult<T>` contains two fields:
* Source (`source`) - the source `String` from which data was detected
* Data (`data`) - the data `T` extracted from the source input

Additionally, for convenience, the generic struct has a `typealias` per result type:
* `DateAnalysisResult` - for `AnalysisResult<Date>`
* `URLAnalysisResult` - for `AnalysisResult<URL>`
* `AddressAnalysisResult` - for `AnalysisResult<[String : String]>`
* `PhoneNumberAnalysisResult` - for `AnalysisResult<String>`
* `TransitAnalysisResult` - for `AnalysisResult<[String : String]>`

### Implementation

To extract dates from some text (`String`):
```swift
if let results = dataDetectorService.extractDates(withTextBody: <someText>) {
    for result in results where result != nil {
        print(result!.source)
        print(result!.data)
        // do some stuff
    }
}
```
For a given `textBody`, the `dataDetectorService` returns an array of `DateAnalysisResult` objects.

To extract dates from multiple sources of text (`[String]`):
```swift
if let combinedResults = dataDetectorService.extractDates(withTextBodies: [<someText>, <someText>, ...]) {
    for individualResults in combinedResults where individualResults != nil {
        for result in individualResults! where result != nil {
            print(result!.source)
            print(result!.data)
            // do some stuff
        }
    }
}
```
For given `textBodies`, the `dataDetectorService` returns an array of `[DateAnalysisResult]` objects.

The extraction process is uniform for other types of data features such as phone numbers, addresses, links, and more.

For more complex extractions - such as requests for addresses and transit details, the returned data is of type `[String : String]`. For convenience, `Address` and `Transit` structures with the associated keys are provided for easy access. For example, to access the zipcode in an extracted address, simply use the key `Address.zip`.

### Examples

Consider the following inputs:
```swift
let meeting: String = "Meeting at 9pm tomorrow"
let party: String = "Party next Friday at 8pm"
```

Using `dataDetectorService`'s `extractDates(withTextBody: String)` function, we receive the following output for `meeting`:
* `source` = "at 9pm tomorrow"
* `data` = equivalent `Date` object, specifying source date relative to the current date/time on the device

The output is similar for `party`:
* `source` = "next Friday at 8pm"
* `data` = equivalent `Date` object, specifying source date relative to the current date/time on the device

The output format will be uniform for other types of data features as well, with the `data` field returning objects of the appropriate type in each case.

### Limitations

According to Apple's documentation on `NSDataDetector`, the class can currently match dates, addresses, links, phone numbers and transit information, and not other present properties such as grammar and spelling. They have, therefore, been excluded from this framework as well.

Additionally, `NSDataDetector`, while having the facility of extracting airline information from natural language text, does not extract the names of airlines, and only retrieves the flight number data. We are investigating this at the moment.

## Contact

You can contact:
* Mayank Kumar - via [email](mailto:mayankk2308@gmail.com) or [LinkedIn](https://www.linkedin.com/in/mayank-kumar-478245b1/)
* Jeet Parte
* Pinak Jalan

For any inquires or community-related issues.

## License

This project is available under the [MIT](https://github.com/mayankk2308/mkdatadetector-swift/blob/master/LICENSE.md) license.
