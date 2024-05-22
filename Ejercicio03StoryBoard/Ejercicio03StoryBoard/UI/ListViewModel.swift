
import Foundation

class ListViewModel {
    var pokemons: [Pokemon?] = []
    var images : [Data?] = []
    let maxPokemon = 151
    var imagenDownload = 0
    let apiManager: ApiManager
    let coordinator: Coordinator
    let semaphore = DispatchSemaphore(value: 1)
    
    init(apiManager: ApiManager, coordinator: Coordinator) {
        self.apiManager = apiManager
        self.coordinator = coordinator
        
    }
    
    func cellSelect(indexPath: IndexPath){
        guard let pokemon = pokemons[indexPath.row],
              let sprite = images[indexPath.row] else{return}
        coordinator.detail(pokemon: pokemon, imageData: sprite)
    }
    
    func downLoadPokemons(refresh: @escaping () ->()){
        pokemons = [Pokemon?](repeating: nil, count: maxPokemon)
        images = [Data?](repeating: nil, count: maxPokemon)
        
        for i in 1...maxPokemon{
            apiManager.getPokemon(withId: i) { pokemon in
                self.semaphore.signal()
                if let pokemon = pokemon, let id = pokemon.id {
                    self.pokemons[id - 1] = pokemon
                    if let urlImage = pokemon.sprite?.frontDefault {
                        self.apiManager.getSprite(withUrlString: urlImage) { image in
                            self.imagenDownload += 1
                            if let image = image {
                                self.images[id - 1] = image
                            }
                            if self.imagenDownload == self.maxPokemon {
                                DispatchQueue.main.async {
                                    refresh()
                                }
                            }
                        }
                    }
                }
            }
            if i < maxPokemon{
                semaphore.wait()
            }
        }
    }
}
