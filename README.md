# **MKDataDetector for Swift**
![Status badge](https://img.shields.io/badge/status-in%20progress-ff5a5a.svg)
![Platform badge](https://img.shields.io/badge/platforms-iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS-brightgreen.svg)
[![apm](https://img.shields.io/apm/l/vim-mode.svg)]()

A simple convenience wrapper for data detection from natural language text that simplifies data extraction and handling.

Currently in the _**development phase**_.

**Core** collaborators: [Jeet Parte](https://github.com/jeetparte) & [Pinak Jalan](https://github.com/pinakj).

## Purpose

While **Apple's** `NSDataDetector` is useful for extracting useful information from natural language text, it can be cumbersome to use and a little difficult to adopt. To circumvent this issue, we are developing an encapsulating framework called `MKDataDetector` to streamline the original API and simplify its usage and application.

## Usage

To keep things simple, `MKDataDetector` is packaged as a set of extensions that compartmentalize its following capabilities:

* Spelling - spell-checking
* Grammar - grammar checking
* Date - date extraction
* Address - address extraction
* Link - link extraction
* Replacement - symbol replacement, such as **(c) to ©**
* Correction - spell-correction suggestions
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
and so on.

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
