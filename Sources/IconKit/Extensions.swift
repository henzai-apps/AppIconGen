import Foundation
import UniformTypeIdentifiers
import AppKit

extension CGImage {
    func transformed(width: Double, height: Double) -> CGImage {
        let scaleX = width / Double(self.width)
        let scaleY = height / Double(self.height)
        return transformed(scaleX: scaleX, scaleY: scaleY)
    }
    
    private func transformed(scaleX: Double, scaleY: Double) -> CGImage {
        let ciImage = CIImage(cgImage: self)
        let transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        let resizedImage = ciImage.transformed(by: transform, highQualityDownsample: true)
        return CIContext().createCGImage(resizedImage, from: resizedImage.extent)!
    }
    
    @discardableResult func write(to destinationURL: URL, utType: UTType = .png) -> Bool {
        guard let destination = CGImageDestinationCreateWithURL(destinationURL as CFURL, utType.identifier as CFString, 1, nil) else { return false }
        CGImageDestinationAddImage(destination, self, nil)
        return CGImageDestinationFinalize(destination)
    }
}

