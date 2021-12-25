import AppKit

struct AppIconFactory {
    var color: CGColor = NSColor.systemBlue.cgColor
    var symbolImage: NSImage? = nil
    
    func make(width: Int = 1024, height: Int = 1024) -> CGImage {
        let context = CGContext(
            data: nil,
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: width * 4,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGBitmapInfo.byteOrder32Little.rawValue | CGImageAlphaInfo.premultipliedLast.rawValue
        )!
        context.setFillColor(color)
        context.fill(CGRect(x: 0, y: 0, width: width, height: height))
        if let image = symbolImage?.cgImage {
            let rect = CGRect(
                x: (width - image.width) / 2,
                y: (height - image.height) / 2,
                width: image.width,
                height: image.height
            )
            context.draw(image, in: rect)
        }
        return context.makeImage()!
    }
}

