default: test
test: test-framework

carthage-update:
	carthage update --no-use-binaries --platform ios

coverage:
	bundle exec slather coverage -s --input-format profdata --workspace QuickTableViewController.xcworkspace --scheme QuickTableViewController-iOS QuickTableViewController.xcodeproj

build-framework:
	xcodebuild -workspace QuickTableViewController.xcworkspace -scheme QuickTableViewControllerTests-iOS -destination 'platform=iOS Simulator,name=iPhone 6' CODE_SIGN_IDENTITY="" clean build

test-framework:
	xcodebuild -workspace QuickTableViewController.xcworkspace -scheme QuickTableViewController-iOS -destination 'platform=iOS Simulator,name=iPhone 6' -enableCodeCoverage YES CODE_SIGN_IDENTITY="" clean build test

build-example:
	xcodebuild -workspace QuickTableViewController.xcworkspace -scheme Example -sdk iphonesimulator clean build | xcpretty -c && exit ${PIPESTATUS[0]}
