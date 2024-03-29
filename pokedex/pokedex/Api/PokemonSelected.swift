//
//  PokemonSelected.swift
//  pokedex
//
//  Created by Ruben on 29/3/24.
//

import Foundation

struct PokemonSelected: Codable {
    var sprites: PokemonSprites
    var weight: Int
}

struct PokemonSprites: Codable {
    var front_default: String
}

class PokemonSelectedApi {
    /*
     Este método obtiene los datos de un pokemon en poke api en formato json
     y los convierte al model de PokemonSelected - PokemonSprites
     */
    func getData(url: String, completion: @escaping (PokemonSprites) -> ()) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
            }
        }.resume()
    }
}
