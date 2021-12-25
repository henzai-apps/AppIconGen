import Foundation

struct Contents: Codable {
    let images: [Image]
    let info: Info
    
    struct Image: Codable {
        var filename: String
        var idiom: String
        var scale: String
        var size: String
    }
    
    struct Info: Codable {
        var author: String = "xcode"
        var version: Int = 1
    }
}

extension Contents.Image {
    var cgSize: CGSize {
        let x = Double(size.split(separator: "x")[0])!
        let y = Double(size.split(separator: "x")[1])!
        let scale = Double(self.scale.numericString) ?? 1.0
        return CGSize(width: x * scale, height: y * scale)
    }
}

extension String {
    fileprivate var numericString: String {
            let characterSet = CharacterSet(charactersIn: "0123456789.").inverted
            return components(separatedBy: characterSet)
                .joined()
        }
}
