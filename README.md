Chocolate is a library containing additions to Cocoa and Cocoa Touch that
simplify writing Objective C code for OSX/iOS. The things that Apple forgot.

Chocolate consists of three modules:

1. Foundation Additions - Categories on the Foundation classes. These
   are intended to be useful for all Objective C code.

2. Core Data Additions - Categories on Core Data classes.

3. Testing Additions - Categories on Foundation classes that provide
   functionality useful when writing Unit Tests. These are not
   intended to be linked in the actual Application code.

## Usage

Chocolate is published as a [CocoaPod][CocoaPods], with each the
three modules above listed as a separate subspec.

For example, to use the first public release of Chocolate's Foundation
Additions, we will need to add the following to our `Podfile`

    pod 'TDTChocolate/FoundationAdditions', :git => 'git@github.com:talk-to/Chocolate', :tag => '1.0.0'

then run

    $ pod install

and finally import the public header for the Foundation Additions subspec

    #import <TDTChocolate/TDTFoundationAdditions.h>

## Changes

See the [Release Notes][releases].

## Contributing

[Pull Requests are welcome!][using-pull-requests]

### [For Maintainers] Releasing a new version

Use the following rake task to create a new release. This will ask you
for the new version, and then open up an editor for you to enter the
release notes.

    rake release

Subsequently, you need to select the "Add release notes" on the
[GitHub tags listing][tags] for the release to show up on the
[Releases][releases] page.

[CocoaPods]: http://cocoapods.org/
[ios-guides]: https://github.com/talk-to/ios-guides
[using-pull-requests]: https://help.github.com/articles/using-pull-requests
[releases]: https://github.com/talk-to/Chocolate/releases
[tags]: https://github.com/talk-to/Chocolate/tags
