

import Foundation

class DetailViewModel {
    let pokemonTitle: String?
    let pokemonSprite: Data
    let pokemonHeight: Int?
    let pokemonWeight: Int?
    
    init(pokemon: Pokemon, imageData: Data){
        pokemonTitle = pokemon.name
        pokemonSprite = imageData
        pokemonHeight = pokemon.height! * 10
        pokemonWeight = pokemon.weight! * 100
    }
}
