import XCTest
@testable import IconKit
@testable import SFIconKit

final class SFIconKitTests: XCTestCase {
    func testGenerate() throws {
        
        var appIconFactory = SFSymbolIconFactory()
        let iconImage = appIconFactory.make()
        
        let url = FileManager.default.temporaryDirectory
        try AppIconWriter().write(to: url, name: "AppIcon", srcImage: iconImage)
    }
}
