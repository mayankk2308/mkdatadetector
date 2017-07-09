# **MKDataDetector for Swift**
A simple convenience wrapper for data detection from language text.

Currently in the _**design phase**_.

# Purpose

While **Apple's** `NSDataDetector` is useful for extracting useful information from natural language text, I find it cumbersome to use a little difficult to adopt. To circumvent this issue, I am developing an encapsulating framework called 'MKDataDetector' to streamline the original API and simplify its usage and application.

# Usage

To keep things simple, `MKDataDetector` is packaged alongside a convenient enumeration called `ResultType` to extract and modify specific types of information from given text. You can extract data of the following types:

* Spelling (`ResultType.spelling`) - spell-checking
* Grammar (`ResultType.grammar`) - grammar checking
* Date (`ResultType.date`)
* Address (`ResultType.address`)
* Link (`ResultType.link`)
* Replacement (`ResultType.replacement`) - symbol replacement, such as *(c) -> ©*
* Correction (`ResultType.correction`) - spell-correction suggestions
* Transit Information (`ResultType.transitInformation`) - flight information, etc.

You can ordinarily declare an instance as follows:
```swift
let dataDetector: MKDataDetector = MKDataDetector()
```

Further usage to be determined.
