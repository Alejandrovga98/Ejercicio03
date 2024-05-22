

import Foundation

protocol Mappeable: Codable {
    init?(withJSONData: Data?)
}

extension Mappeable {
    init?(withJSONData: Data?) {
        guard let data = withJSONData else { return nil }
        
        do {
            self = try JSONDecoder().decode(Self.self, from:data)
        } catch{
            return nil
        }
    }
}
