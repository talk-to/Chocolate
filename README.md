Chocolate is a library containing additions to Cocoa and Cocoa Touch that
simplify writing Objective C code for OSX/iOS. The things that Apple forgot.

Chocolate consists of three modules:

1. [Foundation Additions][FoundationAdditions] - Categories on the Foundation classes. These
   are intended to be useful for all Objective C code.

2. [Core Data Additions][CoreDataAdditions] - Categories on Core Data classes.

3. [Testing Additions][TestingAdditions] - Categories on Foundation classes that provide
   functionality useful when writing Unit Tests. These are not
   intended to be linked in the actual Application code.

## Usage

Chocolate is published as a [CocoaPod][CocoaPods], with each the
three modules above listed as a separate subspec.

For example, to use Chocolate's [Foundation Additions][FoundationAdditions], add the following to your `Podfile`

    pod 'TDTChocolate/FoundationAdditions'

then run

    $ pod install

and finally import the public header for the [Foundation Additions][FoundationAdditions] subspec

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
[FoundationAdditions]: https://github.com/talk-to/Chocolate/tree/master/TDTChocolate/FoundationAdditions
[CoreDataAdditions]: https://github.com/talk-to/Chocolate/tree/master/TDTChocolate/CoreDataAdditions
[TestingAdditions]: https://github.com/talk-to/Chocolate/tree/master/TDTChocolate/TestingAdditions
