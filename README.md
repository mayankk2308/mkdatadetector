# **MKDataDetector for Swift**
A simple convenience wrapper for data detection from natural language text.

Currently in the _**design phase**_.

## Purpose

While **Apple's** `NSDataDetector` is useful for extracting useful information from natural language text, it can be cumbersome to use and a little difficult to adopt. To circumvent this issue, we are developing an encapsulating framework called `MKDataDetector` to streamline the original API and simplify its usage and application.

## Usage

To keep things simple, `MKDataDetector` is packaged as a set of extensions that compartmentalize its following capabilities:

* Spelling - spell-checking
* Grammar - grammar checking
* Date - date(s) extraction
* Address - address(es) extraction
* Link - link(s) extraction
* Replacement - symbol replacement, such as **(c) -> ©**
* Correction - spell-correction suggestions
* Transit Information - flight information extraction, etc.

In addition to extracting these features, the framework also provides convenience functions to manipulate and organize this data.

### Initialization

You can declare an instance as follows:
```swift
let dataDetectorService: MKDataDetectorService = MKDataDetectorService()
```

Or provide a text body (`String`) for analysis:
```swift
let dataDetectorService: MKDataDetectorService = MKDataDetectorService(textBody: <someText>)
```

Or provide multiple text bodies (`[String]`) for analysis:
```swift
let dataDetectorService: MKDataDetectorService = MKDataDetectorService(textBodies: [<someText>, <someText>, ...])
```

For more dynamic implementations, you can add text bodies later:
```swift
dataDetectorService.addTextBody(textBody: <someText>)
dataDetectorService.addTextBodies(textBodies: [<someText>, <someText>, ...])
```

To restore the state of the service for reuse:
```swift
dataDetectorService.reset()
```

This removes all previously added or used text bodies.

Further usage being decided upon.
