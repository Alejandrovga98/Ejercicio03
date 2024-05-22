
import Foundation

class Pokemon: Mappeable{
    var id: Int?
    var name: String?
    var sprite: Sprite?
    var height: Int?
    var weight: Int?
    var isDefault: Bool?
    
    private enum CodingKeys: String, CodingKey{
        case isDefault = "is_default"
        case id
        case name
        case sprite = "sprites"
        case height
        case weight
    }
}
