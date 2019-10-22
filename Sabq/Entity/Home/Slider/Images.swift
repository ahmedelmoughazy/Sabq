import Foundation

struct Images : Codable {
	let url : String?
	let caption : String?

	enum CodingKeys: String, CodingKey {

		case url = "url"
		case caption = "caption"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		caption = try values.decodeIfPresent(String.self, forKey: .caption)
	}

}
