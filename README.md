Chocolate is a library containing additions to Cocoa and Cocoa Touch that
simplify writing Objective C code for OSX/iOS. The things that Apple forgot.

## Installation

### Manually

* Copy the `TDTChocolate/` subdirectory to somewhere in your source tree.
* Add it the "User Header Search Paths" Build Setting in Xcode.
* Link all the implementation files in `TDTChocolate/` to your target.

### CocoaPods

Chocolate is also published as a [CocoaPod][CocoaPods], available from our
[private spec repository][private-spec-repo].

## Development

#### Workspace

The top level `TDTChocolate.xcworkspace` groups together all Chocolate
source and test files for easy access from Xcode.

#### Unit Tests

Chocolate comes with a test suite within the `Tests` subdirectory. The
`Tests/TDTChocolateTests.xcodeproj` project provides two separate targets
for running the tests on either OSX or iOS.

The test suite itself uses [CocoaPods] to manage it's dependencies, so you'll
need to install them the first time around.

    $ cd Tests
    $ pod install

Subsequently, you can use the `iOSTests` and `OSXTests` targets to run the
test suite.

Notes:

* CocoaPod adds file links to the original source files in `TDTChocolate/`
when we do a pod install from the `Tests/` directory. This means that additions
and deletions of files in the `TDTChocolate/` will not be automatically
tracked. In such cases, you'll need to do a pod install again to update the
links. You could use the following incantation to make things faster:

        $ pod install --no-repo-update

* You will need to install [xcproj] \([why?][whyxcproj]) if you intend to
modify `Tests/Podfile`.

### Updating the Podspec

    $ rake release

If you understand the implications, then you can avoid the prompting by

    $ rake release:next

[CocoaPods]: http://cocoapods.org/
[private-spec-repo]: https://github.com/talk-to/private-cocoapod-specs
[xcproj]: https://github.com/0xced/xcproj
[whyxcproj]: https://github.com/CocoaPods/CocoaPods/wiki/Generate-ASCII-format-xcodeproj
