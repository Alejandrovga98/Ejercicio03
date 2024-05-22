
import UIKit

class PokemonCell: UITableViewCell {

    private static let nib = UINib(nibName: PokemonCell.identifier, bundle: Bundle.main)
    
    static func register(in table: UITableView, for identifier: String = identifier) {
        table.register(nib, forCellReuseIdentifier: Self.identifier)
    }
    
    static var identifier: String {
        .init(describing: self)
    }
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
