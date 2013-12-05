Hot Chocolate is a library containing additions to Cocoa and Cocoa Touch that
simplify writing Objective C code for OSX/iOS. The things that Apple forgot.

## Installation

### Manually

Hot Chocolate is a source distribution, which means using it is as simple as
finding the headers and linking to the source files:

* Copy the `TDTHotChocolate/` subdirectory to somewhere in your source tree.
* Add this directory to the "User Header Search Paths" Build Setting in Xcode.
* Link all the implementation files in `TDTHotChocolate/` to your target.
* Import the umbrella `TDTHotChocolate/TDTHotChocolate.h` header, and hack away.

### CocoaPods

Hot Chocolate is also a "pod", so you can compress the above manual steps by
using [CocoaPods] and adding the following to your `Podfile`.

#### Podfile

    pod 'TDTHotChocolate', :git => 'https://github.com/talk-to/hot-chocolate.git'


## Setting up for Development

This section is intended for programmers who wish to modify Hot Chocolate.

#### Workspace

The top level `TDTHotChocolate.xcworkspace` groups together all Hot Chocolate
source and test files for easy access from Xcode. Use it.

#### Unit Tests

Hot Chocolate comes with a test suite within the `Tests` subdirectory. The
`Tests/TDTHotChocolateTests.xcodeproj` project provides two separate targets
for running the tests on either OSX or iOS.

The test suite itself uses [CocoaPods] to manage it's dependencies, so you'll
need to install them the first time around.

    $ cd Tests
    $ pod install

Subsequently, you can use the `iOSTests` and `OSXTests` targets to run the
test suite.

Note: You will need to install [xcproj] ([why?][whyxcproj]) if you intend to
modify `Tests/Podfile`.

[CocoaPods]: http://cocoapods.org/ ""
[xcproj]: https://github.com/0xced/xcproj "xcproj"
[whyxcproj]: https://github.com/CocoaPods/CocoaPods/wiki/Generate-ASCII-format-xcodeproj 
