default: test
test: test-framework

carthage-update:
	carthage update --no-use-binaries --platform ios

coverage:
	bundle exec slather coverage -s --input-format profdata --workspace QuickTableViewController.xcworkspace --scheme QuickTableViewController-iOS QuickTableViewController.xcodeproj

test-framework:
	xcodebuild -workspace ./QuickTableViewController.xcworkspace -scheme QuickTableViewController-iOS -destination 'platform=iOS Simulator,id=BB742D18-A1B1-4F2B-BB70-ECD71A281CAC' -enableCodeCoverage YES CODE_SIGN_IDENTITY="-" CODE_SIGNING_REQUIRED=NO clean build test

build-example:
	xcodebuild -workspace QuickTableViewController.xcworkspace -scheme Example -sdk iphonesimulator clean build | xcpretty -c && exit ${PIPESTATUS[0]}
