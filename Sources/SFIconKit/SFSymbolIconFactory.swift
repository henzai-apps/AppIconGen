import AppKit

public struct SFSymbolIconFactory {
    public init() {}
    public var color: CGColor = NSColor.systemBlue.cgColor
    public var systemImageName: String = "questionmark.app"
    
    public func make() -> CGImage {
        let config = NSImage.SymbolConfiguration(pointSize: 250, weight: .regular, scale: .large)
        let baseImage = NSImage(systemSymbolName: systemImageName, accessibilityDescription: nil) ?? NSImage(systemSymbolName: "questionmark.app", accessibilityDescription: nil)
        let image = baseImage!.withSymbolConfiguration(config)!.image(with: .white)
        var factory = AppIconFactory()
        factory.symbolImage = image
        factory.color = color
        return factory.make()
    }
}

