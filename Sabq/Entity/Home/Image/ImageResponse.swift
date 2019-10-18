import Foundation

struct ImageResponse : Codable {
	var materials : [String]
	var comics : [ImageComic]
	var code : Int
}
