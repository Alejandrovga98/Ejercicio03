

import Foundation
import UIKit

class ListViewController: ViewController {
    
    static var identifier: String {
        .init(describing: self)
    }
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    private let viewModel: ListViewModel
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: Self.identifier,
                   bundle: .main)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTable()
        self.loadingIndicator.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.global().async {
            self.viewModel.downLoadPokemons {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.loadingIndicator.stopAnimating()
                }
            }
        }
    }
    func configureTable(){
        tableView.dataSource = self
        tableView.delegate = self
        PokemonCell.register(in: self.tableView)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonCell.identifier, for: indexPath) as? PokemonCell
        let pokemon = viewModel.pokemons[indexPath.row]
        let sprite = viewModel.images[indexPath.row]
        cell?.pokemonName.text = pokemon?.name
        cell?.pokemonImage.image = UIImage(data: sprite ?? Data())
        return cell ?? UITableViewCell()
    }
    
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.cellSelect(indexPath: indexPath)
    }
}
