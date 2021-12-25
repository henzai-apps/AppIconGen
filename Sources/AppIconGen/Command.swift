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
    var color: String?
    
    @Option(name: .long, help: "path")
    var path: String?

    mutating func run() throws {
        var appIconFactory = SFSymbolIconFactory()
        if let name = systemImageName {
            appIconFactory.systemImageName = name
        }
        if let color = color {
            appIconFactory.color = NSColor(hex: color).cgColor
        } else {
            appIconFactory.color = NSColor.random().cgColor
        }
        let iconImage = appIconFactory.make()
        var url = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        if let path = path {
            url.appendPathComponent(path)
        }
        try AppIconWriter().write(to: url, name: name, srcImage: iconImage)
    }
}
