import Foundation

struct VideoResponse: Codable {
	var materials: [String]
	var comics: [Material]
	var code: Int
}
