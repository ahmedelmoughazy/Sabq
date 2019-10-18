import Foundation

struct VideoResponse : Codable {
	var materials : [String]
	var comics : [VideoComic]
	var code : Int
}
