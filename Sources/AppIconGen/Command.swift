import ArgumentParser
import Foundation
import AppKit

@main
struct AppiconGen: ParsableCommand {
    @Argument(help: "output appiconset name")
    var name: String = "AppIcon"

    @Option(name: .long, help: "SFSymbol name")
    var symbolName: String?

    @Option(name: .long, help: "hex style color")
    var color: String?

    mutating func run() throws {
        let color = NSColor(hex: self.color ?? "#000000")
        
    }
}
