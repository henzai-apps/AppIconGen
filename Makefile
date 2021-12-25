
install:
	swift build -c release
	mv .build/release/AppIconGen /opt/homebrew/bin/appicongen