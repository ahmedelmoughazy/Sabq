import Foundation

struct SliderResponse: Codable {
	var slider : [Slider]
	var materials : [SliderMaterial]
	var code : Int
}
