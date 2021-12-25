import AppKit

struct SFSymbolIconFactory {
    var color: CGColor = NSColor.systemBlue.cgColor
    var systemImageName: String = "questionmark.app"
    
    func make() -> CGImage {
        let config = NSImage.SymbolConfiguration(pointSize: 250, weight: .regular, scale: .large)
        let image = NSImage(systemSymbolName: systemImageName, accessibilityDescription: nil)!.withSymbolConfiguration(config)!.image(with: .white)
        var factory = AppIconFactory()
        factory.symbolImage = image
        factory.color = color
        return factory.make()
    }
}

