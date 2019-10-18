import Foundation

struct ImageComic : Codable {
	var id : String
	var title : String
	var description : String
	var publishDate : String
	var coverPhoto : String
	var tags : [Tag]
}
