import Foundation

struct ImageResponse : Codable {
	var materials : [String]
	var comics : [Material]
	var code : Int
}
