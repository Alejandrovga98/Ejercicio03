
import Foundation

import Foundation

class Sprite: Mappeable{
    var frontDefault: String?
    
    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
