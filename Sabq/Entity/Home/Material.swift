import Foundation

struct Material: Codable {
	let id: String?
	let title: String?
	let secondaryTitle: String?
	let description: String?
	let publishDate: String?
	let publishDateHijryDate: String?
	let updateDate: String?
	let updateDateHijryDate: String?
	let categoryName: String?
	let parentCategoryName: String?
	let coverPhoto: String?
	let coverPhotoCaption: String?
	let authorName: String?
	let url: String?
	let materialType: String?
	let authorImg: String?
	let authorCity: String?
	let multipleAuthors: Bool?
	let imagesCount: Int?
	let videosCount: Int?
	let noOfLikes: Int?
	let noOfShares: Int?
	let noOfViews: Int?
	let noOfComments: Int?
	let liked: Bool?
	let readLater: Bool?
	let materialUpdated: Bool?
	let isEdit: Bool?
	let hasRelatedMaterials: Bool?
	let authors: [String]?
	let images: [Images]?
	let videos: [Videos]?
	let attachements: [String]?
	let tags: [Tag]?
	let updates: [String]?
	let relatedMaterials: [String]?
	let matarialDisplayed: String?
	let comments: [String]?
	let descriptionString: String?
	let city: String?
	let commentsEnabled: Bool?
	let commentsMinCharacters: Int?
	let commentsMaxCharacters: Int?

    let comicsType: String?
    let vid: String?
    let videoCaption: String?

}
