Chocolate is a library containing additions to Cocoa and Cocoa Touch that
simplify writing Objective C code for OSX/iOS. The things that Apple forgot.

Chocolate consists of three "sub-libraries":

1. Foundation Additions - Categories on the Foundation classes. These
   are intended to be useful for all Objective C code.

2. Core Data Additions - Categories on Core Data classes.

3. Testing Additions - Categories on Foundation classes that provide
   functionality useful when writing Unit Tests. These are not
   intended to be linked in the actual Application code.

## Usage

Chocolate is published as a [CocoaPod][CocoaPods], with each the
three "sub-libraries" above listed as a separate "subspec".

For example, to use the first public release of Chocolate's Foundation Additions, we will need to add the following to our `Podfile`

    pod 'TDTChocolate/FoundationAdditions', :git => 'git@github.com:talk-to/Chocolate', :tag => '1.0.0'

then run

    $ pod install

and finally import the public header for the Foundation Additions subspec

    #import <TDTChocolate/TDTFoundationAdditions.h>

## Contributing

You can contribute to Chocolate by opening a pull request on this
repository. Make sure you go through the
[Talk.to iOS Development Guidelines][ios-guides] first to get an idea
of the expectations. Once your pull request is reviewed by one of the
maintainers, you can merge your changes into the mainline.

### Release Checklist

* Update the CHANGELOG.

* Modify the version in the Podspec.

* Update the version of Chocolate used by the Tests

        cd Tests/ && pod update --no-repo-update

* Run the tests.

* Commit and push the changes.

* Create a tag with the version, and push it to remote.

[CocoaPods]: http://cocoapods.org/
[ios-guides]: https://github.com/talk-to/ios-guides
