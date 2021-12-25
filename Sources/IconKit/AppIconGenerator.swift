import Foundation
import AppKit

struct AppIconWriter {
    let fileManager: FileManager = .default
    
    func write(to path: URL, name: String = "AppIcon", srcImage: CGImage) throws {
        // AppIcon.appiconset
        let appiconsetURL = path.appendingPathComponent("\(name).appiconset")
        try fileManager.createDirectory(
            at: appiconsetURL,
            withIntermediateDirectories: true,
            attributes: nil
        )
        
        // Contents.json
        let contents = Contents(images: contentsImages, info: Contents.Info())
        let contentsJSON = try JSONEncoder().encode(contents)
        try contentsJSON.write(to: appiconsetURL.appendingPathComponent("Contents.json"))
        
        // png images
        contents.images.forEach { imageInfo in
            let size = imageInfo.cgSize
            let resizedImage = srcImage.transformed(width: size.width, height: size.height)
            resizedImage.write(to: appiconsetURL.appendingPathComponent(imageInfo.filename))
        }
    }
    
    let contentsImages: [Contents.Image] = [
        Contents.Image(
              filename : "Icon-Notification@2x.png",
              idiom : "iphone",
              scale : "2x",
              size : "20x20"
        ),
        Contents.Image(
              filename : "Icon-Notification@3x.png",
              idiom : "iphone",
              scale : "3x",
              size : "20x20"
        ),
        Contents.Image(
              filename : "Icon-Small@2x.png",
              idiom : "iphone",
              scale : "2x",
              size : "29x29"
        ),
        Contents.Image(
              filename : "Icon-Small@3x.png",
              idiom : "iphone",
              scale : "3x",
              size : "29x29"
        ),
        Contents.Image(
              filename : "Icon-Small-40@2x.png",
              idiom : "iphone",
              scale : "2x",
              size : "40x40"
        ),
        Contents.Image(
              filename : "Icon-Small-40@3x.png",
              idiom : "iphone",
              scale : "3x",
              size : "40x40"
        ),
        Contents.Image(
              filename : "Icon-60@2x.png",
              idiom : "iphone",
              scale : "2x",
              size : "60x60"
        ),
        Contents.Image(
              filename : "Icon-60@3x.png",
              idiom : "iphone",
              scale : "3x",
              size : "60x60"
        ),
        Contents.Image(
              filename : "Icon-Notification.png",
              idiom : "ipad",
              scale : "1x",
              size : "20x20"
        ),
        Contents.Image(
              filename : "Icon-Notification@2x.png",
              idiom : "ipad",
              scale : "2x",
              size : "20x20"
        ),
        Contents.Image(
              filename : "Icon-Small.png",
              idiom : "ipad",
              scale : "1x",
              size : "29x29"
        ),
        Contents.Image(
              filename : "Icon-Small@2x.png",
              idiom : "ipad",
              scale : "2x",
              size : "29x29"
        ),
        Contents.Image(
              filename : "Icon-Small-40.png",
              idiom : "ipad",
              scale : "1x",
              size : "40x40"
        ),
        Contents.Image(
              filename : "Icon-Small-40@2x.png",
              idiom : "ipad",
              scale : "2x",
              size : "40x40"
        ),
        Contents.Image(
              filename : "Icon-76.png",
              idiom : "ipad",
              scale : "1x",
              size : "76x76"
        ),
        Contents.Image(
              filename : "Icon-76@2x.png",
              idiom : "ipad",
              scale : "2x",
              size : "76x76"
        ),
        Contents.Image(
              filename : "Icon-83.5@2x.png",
              idiom : "ipad",
              scale : "2x",
              size : "83.5x83.5"
        ),
        Contents.Image(
              filename : "icon.png",
              idiom : "ios-marketing",
              scale : "1x",
              size : "1024x1024"
        ),
        Contents.Image(
              filename : "icon_16x16.png",
              idiom : "mac",
              scale : "1x",
              size : "16x16"
        ),
        Contents.Image(
              filename : "icon_16x16@2x.png",
              idiom : "mac",
              scale : "2x",
              size : "16x16"
        ),
        Contents.Image(
              filename : "icon_32x32.png",
              idiom : "mac",
              scale : "1x",
              size : "32x32"
        ),
        Contents.Image(
              filename : "icon_32x32@2x.png",
              idiom : "mac",
              scale : "2x",
              size : "32x32"
        ),
        Contents.Image(
              filename : "icon_128x128.png",
              idiom : "mac",
              scale : "1x",
              size : "128x128"
        ),
        Contents.Image(
              filename : "icon_128x128@2x.png",
              idiom : "mac",
              scale : "2x",
              size : "128x128"
        ),
        Contents.Image(
              filename : "icon_256x256.png",
              idiom : "mac",
              scale : "1x",
              size : "256x256"
        ),
        Contents.Image(
              filename : "icon_256x256@2x.png",
              idiom : "mac",
              scale : "2x",
              size : "256x256"
        ),
        Contents.Image(
              filename : "icon_512x512.png",
              idiom : "mac",
              scale : "1x",
              size : "512x512"
        ),
        Contents.Image(
              filename : "icon_512x512@2x.png",
              idiom : "mac",
              scale : "2x",
              size : "512x512"
        )
    ]
}
