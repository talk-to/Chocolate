## Release Checklist for Maintainers

* Update the CHANGELOG.

* Modify the version in the Podspec.

* Update the version of Chocolate used by the Tests

    	cd Tests/ && pod update --no-repo-update

* Run the tests.

* Commit your changes.

* `rake publish`
