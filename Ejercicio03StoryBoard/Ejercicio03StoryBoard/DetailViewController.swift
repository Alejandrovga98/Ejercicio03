

import Foundation
import UIKit

class DetailViewController: ViewController {
    
    static var identifier: String {
        .init(describing: self)
    }
    
    @IBOutlet weak var nameLabelPokemon: UILabel!
    @IBOutlet weak var imageViewPokemon: UIImageView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    private let viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: Self.identifier,
                   bundle: .main)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabelPokemon.text = viewModel.pokemonTitle
        imageViewPokemon.image = UIImage(data: viewModel.pokemonSprite)
        heightLabel.text = "Altura: \(viewModel.pokemonHeight!)cm"
        weightLabel.text = "Peso : \(viewModel.pokemonWeight!)g"
        
    }
}
