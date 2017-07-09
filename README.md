# **MKDataDetector for Swift**
A simple convenience wrapper for data detection from natural language text.

Currently in the _**design phase**_.

## Purpose

While **Apple's** `NSDataDetector` is useful for extracting useful information from natural language text, it can be cumbersome to use and a little difficult to adopt. To circumvent this issue, we are developing an encapsulating framework called `MKDataDetector` to streamline the original API and simplify its usage and application.

## Usage

To keep things simple, `MKDataDetector` is packaged alongside a convenient enumeration called `ResultType` to extract and modify specific types of information from given text. You can extract data of the following types:

* Spelling (`ResultType.spelling`) - spell-checking
* Grammar (`ResultType.grammar`) - grammar checking
* Date (`ResultType.date`)
* Address (`ResultType.address`)
* Link (`ResultType.link`)
* Replacement (`ResultType.replacement`) - symbol replacement, such as *(c) -> ©*
* Correction (`ResultType.correction`) - spell-correction suggestions
* Transit Information (`ResultType.transitInformation`) - flight information, etc.

In addition to extracting these features, the framework also provides convenience functions to manipulate and organize this data.

### Initialization

You can declare an instance as follows:
```swift
let dataDetector: MKDataDetectorService = MKDataDetectorService()
```

Or provide a text body (`String`) for analysis:
```swift
let dataDetector: MKDataDetectorService = MKDataDetectorService(textBody: <someText>)
```

Or provide multiple text bodies (`[String]`) for analysis:
```swift
let dataDetector: MKDataDetectorService = MKDataDetectorService(textBodies: [<someText>, <someText>, ...])
```
For more dynamic implementations, you can add text bodies later:
```swift
dataDetector.addTextBody(textBody: <someText>)
dataDetector.addTextBodies(textBodies: [<someText>, <someText>, ...])
```

### Performing Analysis

To facilitate and unify result handling, a simple ```AnalysisResult``` structure is returned via a completion handler:
```swift
dataDetector.analyze(ResultType.date) { success, result in
    if success {
        // do some stuff
    }
}
```
Further usage being decided upon.
