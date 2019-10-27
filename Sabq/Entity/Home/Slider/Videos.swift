import Foundation

struct Videos : Codable {
	let vid : String?
	let caption : String?

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		vid = try values.decodeIfPresent(String.self, forKey: .vid)
		caption = try values.decodeIfPresent(String.self, forKey: .caption)
	}

}
