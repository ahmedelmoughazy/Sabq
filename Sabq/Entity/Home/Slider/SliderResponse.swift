import Foundation

struct SliderResponse: Codable {
    let slider : [Material]?
    let materials : [Material]?
    let code : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case slider = "slider"
        case materials = "materials"
        case code = "code"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        slider = try values.decodeIfPresent([Material].self, forKey: .slider)
        materials = try values.decodeIfPresent([Material].self, forKey: .materials)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
    }
}
