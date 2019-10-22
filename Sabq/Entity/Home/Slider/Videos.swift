import Foundation

struct Videos : Codable {
	let vid : String?
	let caption : String?

	enum CodingKeys: String, CodingKey {

		case vid = "vid"
		case caption = "caption"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		vid = try values.decodeIfPresent(String.self, forKey: .vid)
		caption = try values.decodeIfPresent(String.self, forKey: .caption)
	}

}
