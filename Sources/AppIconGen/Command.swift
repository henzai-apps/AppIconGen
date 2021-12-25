import ArgumentParser
import Foundation
import AppKit
import SFIconKit
import IconKit

@main
struct AppiconGen: ParsableCommand {
    @Argument(help: "output appiconset name")
    var name: String = "AppIcon"

    @Option(name: .long, help: "SFSymbol name")
    var systemImageName: String?

    @Option(name: .long, help: "hex style color")
    var color: String = "#000000"

    mutating func run() throws {
        var appIconFactory = SFSymbolIconFactory()
        if let name = systemImageName {
            appIconFactory.systemImageName = name
        }
        appIconFactory.color = NSColor(hex: self.color).cgColor
        
        let iconImage = appIconFactory.make()
        let url = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        try AppIconWriter().write(to: url, name: name, srcImage: iconImage)
    }
}
